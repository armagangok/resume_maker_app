import 'package:flutter/cupertino.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../../../core/export/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              print(element.pdfPath);
              pdfList.add(
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: PDFView(
                    filePath: element.pdfPath ?? "",
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
}
