import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../../../core/export/export.dart';
import '../cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            print(data);
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
                  return GridView.builder(
                    itemCount: state.userDataList.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return dragableItem(index, state);
                    },
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

  Widget dragableItem(int index, state) {
    return Draggable(
      data: index,
      feedback: item(state, index),
      childWhenDragging: const SizedBox(),
      child: item(state, index),
      onDragStarted: () {
        setState(() {
          dragStarted = true;
          selectIndex = index;
        });
      },
      onDragEnd: (details) {
        // print(details.offset);
      },
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

  Widget item(state, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            radius: 61.2.h,
            backgroundColor: white,
            child: CircleAvatar(
              backgroundColor: iconBackground,
              radius: 60.h,
              child: state.userDataList[index].personal!.imagePath!.isNotEmpty
                  ? ClipOval(
                      child: Image.file(
                        File(state.userDataList[index].personal!.imagePath!),
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                  : Icon(
                      CupertinoIcons.person_solid,
                      color: white,
                      size: 60.h,
                    ),
            ),
          ),
        ),
        // Text(
        //   state.userDataList[index].personal!.fullName!,
        // ),
        // Text(
        //   state.userDataList[index].personal!.title!,
        // ),
      ],
    );
  }
}

// /Users/armagangok/Library/Developer/CoreSimulator/Devices/181F7EF9-7AA0-4250-95D2-3AAE345E042A/data/Containers/Data/Application/15BC2199-FE4D-4777-A842-98ED691378CB/Documents