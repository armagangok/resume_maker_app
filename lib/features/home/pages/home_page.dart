import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../core/util/file_helper.dart';
import '/core/export/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Injection.homeCubit.fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _bodyWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _floatingButton(),
    );
  }

  CupertinoNavigationBar _buildAppBar() => const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text("Saved PDF Files"),
      );

  Widget _floatingButton() => FloatingActionButton(
        backgroundColor: white,
        child: Icon(
          CupertinoIcons.add,
          size: 30.h,
        ),
        onPressed: () => Injection.navigator.navigaToClear(path: rootPage),
      );

  Widget _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeUserDataDeleteFailure) {
            _getSnackBar(context, "Failed to delete user resume data.");
          } else if (state is HomeUserDataSaved) {
            _getSnackBar(context, "User resume data saved successfuly.");
          } else if (state is HomeUserDataSavingFailure) {
            _getSnackBar(context, "Failed to save user resume data.");
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
              return _savedResumeTemplateBuilder(state);
            }
          } else if (state is HomeUserDataFetching) {
            return const Column(
              children: [
                Text("PDF Data fetching, please wait."),
                CupertinoActivityIndicator(),
              ],
            );
          } else {
            return const Text("");
          }
        },
      ),
    );
  }

  GridView _savedResumeTemplateBuilder(HomeUserDataFetched state) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.625,
        ),
        itemCount: state.userDataList.length,
        itemBuilder: (context, index) {
          File file = File(state.userDataList[index].pdfPath ?? "");

          return _gridItem(file, context, state.userDataList[index], index);
        },
      );

  Column _gridItem(
    File file,
    BuildContext contex,
    UserData userData,
    int index,
  ) =>
      Column(
        children: [
          Expanded(
            child: Card(
              child: SfPdfViewer.file(
                file,
                enableDocumentLinkAnnotation: false,
                enableDoubleTapZooming: false,
                enableTextSelection: false,
                enableHyperlinkNavigation: false,
              ),
            ),
          ),
          // SizedBox(

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _editButton(userData),
              _deleteButton(index),
              _openButton(file.path),
            ],
          ),
        ],
      );

  Widget _openButton(String filePath) {
    return Builder(
      builder: (context) => InkWell(
        child: GestureDetector(
          onTap: () async {
            print("pressedddd");
            try {
              await LauncherHelper.launchFile(filePath);
            } catch (e) {
              context.showSnackBar(
                const SnackBar(
                  content: Text('An error occured while opening pdf file. Please try again'),
                ),
              );
            }
          },
          child: Column(
            children: [
              const Icon(
                CupertinoIcons.folder_open,
                color: white,
              ),
              _itemText("Open"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _deleteButton(int index) => Builder(
        builder: (context) => InkWell(
          onTap: () async => await context.cupertinoDialog(
            widget: Center(
              child: Padding(
                padding: EdgeInsets.all(KPadding.height30),
                child: CupertinoActionSheet(
                  title: Text(
                    "Are you sure to delete?",
                    style: context.titleMedium,
                  ),
                  message: const Text(
                    "Resume will be deleted forever.",
                  ),
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () async {
                        await Injection.homeCubit.deleteUserData(index);
                        Injection.navigator.pop();
                      },
                      child: Text(
                        "Delete",
                        style: context.bodyMedium.copyWith(
                          color: deleteRedColor,
                        ),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () => Injection.navigator.pop(),
                      child: Text(
                        "Discard",
                        style: context.bodyMedium.copyWith(
                          color: selectedItemColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: Column(
            children: [
              const Icon(
                CupertinoIcons.trash_fill,
                color: deleteRedColor,
              ),
              _itemText("Delete"),
            ],
          ),
        ),
      );

  InkWell _editButton(UserData userData) => InkWell(
        onTap: () async => context.cupertinoDialog(
          widget: Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Padding(
                padding: EdgeInsets.all(KPadding.height30),
                child: CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () => Injection.navigator.pop(),
                      child: Text(
                        "OK",
                        style: context.bodyMedium.copyWith(color: selectedItemColor),
                      ),
                    ),
                  ],
                  title: Text(
                    "Message from developer!",
                    style: context.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  message: const Text(
                    "Edit resume feature will be enabled very soon! We are grateful for your understanding.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        child: Column(
          children: [
            const Icon(
              CupertinoIcons.hand_draw_fill,
              color: selectedItemColor,
            ),
            _itemText("Edit"),
          ],
        ),
      );

  Text _itemText(text) => Text(
        text,
        style: context.bodySmall,
      );

  void _getSnackBar(BuildContext context, text) => context.showSnackBar(
        SnackBar(content: Text(text)),
      );
}
