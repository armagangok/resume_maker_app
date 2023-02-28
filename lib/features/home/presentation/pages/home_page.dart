import 'package:flutter/cupertino.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../../../core/export/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final controller = FileManagerController();

  // bool dragStarted = false;

  // int selectIndex = -1;

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
        floatingActionButton: FloatingActionButton(
          backgroundColor: white,
          child: Icon(
            CupertinoIcons.add,
            size: 30.h,
          ),
          onPressed: () {
            Injection.navigator.navigaToClear(path: rootPage);
          },
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return BlocConsumer<HomeCubit, HomeState>(
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
            List<Widget> pdfList = [];
            for (var element in state.userDataList) {
              pdfList.add(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PDFView(
                    filePath: element.pdfPath ?? "",
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                    onRender: (pages) {
                      // setState(() {
                      //   pages = _pages;
                      //   isReady = true;
                      // });
                    },
                    onError: (error) {
                      print(error.toString());
                    },
                    onPageError: (page, error) {
                      print('$page: ${error.toString()}');
                    },
                    onViewCreated: (PDFViewController pdfViewController) {
                      // _controller.complete(pdfViewController);
                    },
                    // onPageChanged: (int page, int total) {
                    //   print('page change: $page/$total');
                    // },
                  ),
                ),
              );
            }
            return GridView.custom(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              childrenDelegate: SliverChildListDelegate.fixed(pdfList),
            );
          }
        } else {
          return const Text("data");
        }
      },
    );
  }

  // Widget _floatingActionButton() => dragStarted
  //     ? DragTarget(
  //         builder: (context, candidateData, rejectedData) {
  //           return FloatingActionButton(
  //             backgroundColor: Colors.red,
  //             child: Icon(
  //               CupertinoIcons.trash,
  //               size: 30.h,
  //               color: white,
  //             ),
  //             onPressed: () {},
  //           );
  //         },
  //         onWillAccept: (data) {
  //           if (data is int) {
  //             return true;
  //           } else {
  //             return false;
  //           }
  //         },
  //         onAccept: (int data) async {
  //           // print(data);
  //           // await Injection.fileEntityCubit.deleteFileEntityUserData(data);
  //           // await Injection.fileEntityCubit.fetchFileEntityUserData();
  //         },
  //       )
  //     : FloatingActionButton(
  //         backgroundColor: white,
  //         child: Icon(
  //           CupertinoIcons.add,
  //           size: 30.h,
  //         ),
  //         onPressed: () {
  //           Injection.navigator.navigaToClear(path: rootPage);
  //         },
  //       );

  // bool ifFileIsPdf(FileSystemEntity element) =>
  //     ".pdf" == extension(element.path);

  // Widget dragableItem(int index, state, String path) {
  //   return SizedBox(
  //     height: 100.h,
  //     child: Draggable(
  //       data: index,
  //       feedback: item(path),
  //       childWhenDragging: const SizedBox(),
  //       child: item(path),
  //       onDragStarted: () {
  //         setState(() {
  //           dragStarted = true;
  //           selectIndex = index;
  //         });
  //       },
  //       onDragEnd: (details) {},
  //       onDraggableCanceled: (velocity, offset) {
  //         setState(() {
  //           dragStarted = false;
  //         });
  //       },
  //       onDragCompleted: () {
  //         setState(() {
  //           dragStarted = false;
  //         });
  //       },
  //     ),
  //   );
  // }

  // Widget item(path) {
  //   return SizedBox(
  //     height: 100.h,
  //     child: Padding(
  //       padding: EdgeInsets.all(5.w),
  //       child: PdfView(path: path),
  //     ),
  //   );
  // }
}
