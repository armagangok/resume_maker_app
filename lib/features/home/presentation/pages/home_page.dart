import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

import '../../../../core/export/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = FileManagerController();

  bool dragStarted = false;

  // bool accepted = false;

  int selectIndex = -1;

  @override
  void initState() {
    Injection.homeCubit.fetchHomeUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _bodyWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _floatingActionButton(),
      ),
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
            print(data);
            // await Injection.fileEntityCubit.deleteFileEntityUserData(data);
            // await Injection.fileEntityCubit.fetchFileEntityUserData();
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

// HomeInitial
// HomeUserDataSavingFailure
// HomeUserDataSaved
// HomeUserDataDeleted
// HomeUserDataDeleteFailure
//  HomeUserDataFetched
// HomeUserDataFetchFailure

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
              List<Widget> widgetList = [];
              if (state is HomeUserDataFetched) {
                if (state.userDataList.isEmpty) {
                  return const Center(
                    child: Text("Please create a new resume for yourself!"),
                  );
                } else {
                  
                  for (var userDataModel in state.userDataList) {
                    widgetList.add(
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: PdfView(path: userDataModel.pdfPath ?? ""),
                      ),
                    );
                  }

                  return GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (0.8),
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: widgetList,
                  );
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

  bool ifFileIsPdf(FileSystemEntity element) =>
      ".pdf" == extension(element.path);

  Widget dragableItem(int index, state, path) {
    return SizedBox(
      height: 100.h,
      child: Draggable(
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
      ),
    );
  }

  Widget item(state, index, path) {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: PdfView(path: path),
      ),
    );
  }
}

// /Users/armagangok/Library/Developer/CoreSimulator/Devices/181F7EF9-7AA0-4250-95D2-3AAE345E042A/data/Containers/Data/Application/15BC2199-FE4D-4777-A842-98ED691378CB/Documents
