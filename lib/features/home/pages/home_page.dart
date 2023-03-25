import 'dart:io';

import 'package:flutter/cupertino.dart';


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
          return Column(
            children: const [
              Text("PDF Data fetching, please wait."),
              CircularProgressIndicator(),
            ],
          );
        } else {
          return const Text("data");
        }
      },
    );
  }

  GridView _savedResumeTemplateBuilder(HomeUserDataFetched state) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.625,
      ),
      itemCount: state.userDataList.length,
      itemBuilder: (context, index) {
        File file = File(state.userDataList[index].pdfPath ?? "");
        return _gridItem(file, context, state.userDataList[index] ,index);
      },
    );
  }

  Column _gridItem(File file, BuildContext contex, UserData userData,int index) {
    return Column(
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
          ],
        ),
      ],
    );
  }

  Widget _deleteButton(int index) => Builder(
      builder: (context) {
        return InkWell(
          onTap: () async => await context.cupertinoDialog(
              widget: IosChoiceDialog(
                title: "Are you sure?",
                message: "Resume will be deleted forever.",
                action1: DialogAction(actionText: "Delete", action: ()async{
                  await Injection.homeCubit.deleteUserData(index);
                  Injection.navigator.pop();
                }),
                action3: DialogAction(
                  actionText: "Get Back", 
                  action: () {
                    Injection.navigator.pop();
                  },
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
        );
      }
    );

  InkWell _editButton(UserData userData) {
    return InkWell(
      onTap: () async {
        // SavedResumeDataProvider.shared.setupControllers(userData);
        // Injection.navigator.navigateTo(path: rootPage);
        context.cupertinoDialog(
          
          widget:  Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoActionSheet(
              
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () => Injection.navigator.pop(), 
                  child: Text("OK",style: context.bodyMedium.copyWith(
                    color: Colors.white
                    ),
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
      );
      },
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
  }

  Text _itemText(text) => Text(
        text,
        style: context.bodySmall,
      );

  void _getSnackBar(BuildContext context, text) => context.showSnackBar(
        SnackBar(content: Text(text)),
      );
}


