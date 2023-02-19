import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:resume_maker_app/core/widget/custom_container.dart';

import '../../../../core/export/export.dart';
import '../../../root_page/presentation/cubit/root_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BlocConsumer<RootCubit, RootState>(
            listener: (context, state) {
              if (state is UserDataDeleteFailure) {
                context.showSnackBar(const SnackBar(
                  content: Text("Failed to delete user resume data."),
                ));
              } else if (state is UserDataSaved) {
                context.showSnackBar(const SnackBar(
                  content: Text("User resume data saved successfuly."),
                ));
              } else if (state is UserDataSavingFailure) {
                context.showSnackBar(const SnackBar(
                  content: Text("Failed to save user resume data."),
                ));
              }
            },
            bloc: Injection.rootCubit,
            builder: (context, state) {
              if (state is UserDataFetched) {
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
                                child: state.userDataList[index].personal!
                                            .imagePath !=
                                        null
                                    ? ClipOval(
                                        child: Image.file(
                                          File(state.userDataList[index]
                                              .personal!.imagePath!),
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
                          Text(
                            state.userDataList[index].personal!.fullName!,
                          ),
                          Text(
                            state.userDataList[index].personal!.title!,
                          ),
                        ],
                      );
                    },
                  );
                }
              } else {
                return const Text("data");
              }
            },
          ),
        ),
        _createResumeButton(),
      ],
    );
  }

  Widget _createResumeButton() {
    return Padding(
      padding: EdgeInsets.all(30.h),
      child: CustomContainer(
        borderRadius: BorderRadius.zero,
        borderColor: iconColor,
        color: primaryColor,
        child: SizedBox(
          height: 80.h,
          child: InkWell(
            onTap: () {
              Injection.navigator.navigateTo(path: rootPage);
            },
            child: Center(
              child: Text(
                "CREATE RESUME",
                style: context.displayMedium.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu_rounded,
        ),
      ),
    );
  }
}
