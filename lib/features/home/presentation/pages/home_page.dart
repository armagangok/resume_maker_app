import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

import '../../../../core/export/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = FileManagerController();

  @override
  void initState() {
    super.initState();
  }

  bool dragStarted = false;

  // bool accepted = false;

  int selectIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _floatingActionButton() => dragStarted
      ? DragTarget(
          builder: (context, candidateData, rejectedData) {
            return FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(
                CupertinoIcons.trash,
                size: 30.h,
                color: white,
              ),
              onPressed: () {},
            );
          },
          onWillAccept: (data) {
            if (data is int) {
              return true;
            } else {
              return false;
            }
          },
          onAccept: (int data) async {
            await Injection.homeCubit.deleteHomeUserData(data);
            await Injection.homeCubit.fetchHomeUserData();
          },
        )
      : FloatingActionButton(
          backgroundColor: white,
          child: Icon(
            CupertinoIcons.add,
            size: 30.h,
          ),
          onPressed: () {
            Injection.navigator.navigaToClear(path: rootPage);
          },
        );

  Widget _bodyWidget() {
    // return getPdfFiles();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeUserDataDeleteFailure) {
                context.showSnackBar(const SnackBar(
                  content: Text("Failed to delete user resume data."),
                ));
              } else if (state is HomeUserDataSaved) {
                context.showSnackBar(const SnackBar(
                  content: Text("User resume data saved successfuly."),
                ));
              } else if (state is HomeUserDataSavingFailure) {
                context.showSnackBar(const SnackBar(
                  content: Text("Failed to save user resume data."),
                ));
              }
            },
            bloc: Injection.homeCubit,
            builder: (context, state) {
              if (state is HomeUserDataFetched) {
                if (state.userDataList.isEmpty) {
                  return const Center(
                    child: Text("Please create a new resume for yourself!"),
                  );
                } else {
                  return FutureBuilder(
                    future: getPath(),
                    builder: (context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        var path = snapshot.data;
                        var fileList = Directory(path!).listSync();

                        return GridView.builder(
                          itemCount: fileList.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return dragableItem(
                              index,
                              state,
                              fileList[index].path,
                            );
                          },
                        );
                      } else {
                        return const Center();
                      }
                    },
                  );
                  // return FileManager(
                  //   controller: controller,
                  //   builder: (context, snapshot) {
                  //     final List<FileSystemEntity> entities = snapshot;
                  //     print(entities);
                  //     return ListView.builder(
                  //       itemCount: entities.length,
                  //       itemBuilder: (context, index) {
                  //         return Card(
                  //           child: ListTile(
                  //             leading: FileManager.isFile(entities[index])
                  //                 ? const Icon(Icons.feed_outlined)
                  //                 : const Icon(Icons.folder),
                  //             title:
                  //                 Text(FileManager.basename(entities[index])),
                  //             onTap: () {
                  //               if (FileManager.isDirectory(entities[index])) {
                  //                 controller.openDirectory(
                  //                   entities[index],
                  //                 ); // open directory
                  //               } else {
                  //                  controller.openDirectory(
                  //                   entities[index],
                  //                 ); // open dir
                  //                 // Perform file-related tasks.
                  //               }
                  //             },
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  // );
                  // return FutureBuilder(
                  //     future: getPath(),
                  //     builder: (context, AsyncSnapshot<String> snapshot) {
                  //       if (snapshot.hasData) {
                  //         print(snapshot.data);
                  //         return Text(snapshot.data!);
                  //       } else {
                  //         return const FittedBox(
                  //           child: Text(
                  //             "No data",
                  //             style: TextStyle(),
                  //             maxLines: 1,
                  //           ),
                  //         );
                  //       }
                  //     });
                }
              } else {
                return const Text("data");
              }
            },
          ),
        ),
      ],
    );
  }

  Future<String> getPath() async {
    final output = await getExternalStorageDirectory();
    return output!.path;
  }

  Widget dragableItem(int index, state, path) {
    return Draggable(
      data: index,
      feedback: item(state, index, path),
      childWhenDragging: const SizedBox(),
      child: item(state, index, path),
      onDragStarted: () {
        setState(() {
          dragStarted = true;
          selectIndex = index;
        });
      },
      onDragEnd: (details) {},
      onDraggableCanceled: (velocity, offset) {
        setState(() {
          dragStarted = false;
        });
      },
      onDragCompleted: () {
        setState(() {
          dragStarted = false;
        });
      },
    );
  }

  Widget item(state, index, path) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PdfView(path: path),
    );
  }
}

// /Users/armagangok/Library/Developer/CoreSimulator/Devices/181F7EF9-7AA0-4250-95D2-3AAE345E042A/data/Containers/Data/Application/15BC2199-FE4D-4777-A842-98ED691378CB/Documents