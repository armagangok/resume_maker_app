import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../core/export/export.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: _bottomDivider(),
      leading: _menuButton(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: false,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.menu_rounded,
                size: 45.h,
              ),
            ),
          ),
          Text(
            _getDate,
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          GestureDetector(
            onTap: () async => context.cupertinoDialog(
              widget: dialogWidget(),
            ),
            child: CircleAvatar(
              radius: 20.h,
              backgroundColor: selectedItemColor,
              child: const Center(
                child: Icon(
                  CupertinoIcons.checkmark_alt,
                  color: white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dialogWidget() => Builder(builder: (context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(30.0.w),
            child: CupertinoActionSheet(
              title: Text(
                "Warning",
                style: context.bodyMedium,
              ),
              message: Text(
                "Do you wish to save your changes?",
                style: context.bodySmall
                    .copyWith(color: const Color.fromARGB(255, 164, 164, 164)),
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () async {
                    String pdfName = DateFormat('yyyy-MM-dd  kk.mm.ss').format(
                      DateTime.now(),
                    );

                    UserDataProvider.prepareUserData(
                      pdfPathToSave: "",
                    );

                    var pdfPath = await Injection.previewCubit.createPdf(
                      fileName: pdfName,
                    );

                    UserDataProvider.prepareUserData(
                      pdfPathToSave: pdfPath,
                    );

                    var encodedJson = UserDataProvider.encodeUserData();

                    await Injection.rootCubit.saveUserData(encodedJson);
                    await Injection.homeCubit.fetchUserData();
                    Injection.navigator.navigaToClear(path: homePage);
                  },
                  child: Text(
                    "Save",
                    style: context.bodyMedium.copyWith(
                      color: selectedItemColor,
                    ),
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    Injection.navigator.navigaToClear(path: homePage);
                  },
                  child: Text(
                    "Don't Save",
                    style: context.bodyMedium.copyWith(color: deleteRedColor),
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    Injection.navigator.pop();
                  },
                  child: Text(
                    "Get Back",
                    style: context.bodyMedium.copyWith(color: deleteRedColor),
                  ),
                ),
              ],
            ),
          ),
        );
      });

  PreferredSize _bottomDivider() => PreferredSize(
        preferredSize: Size.fromHeight(4.0.h),
        child: Container(
          color: iconBackground,
          height: 0.5.h,
        ),
      );

  Widget _menuButton() => GestureDetector(
        onTap: () {},
        child: Center(
          child: CircleAvatar(
            backgroundColor: selectedItemColor,
            radius: 20.h,
            child: const Icon(
              Icons.menu_rounded,
              color: white,
            ),
          ),
        ),
      );

  String get _getDate {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final String formatted = formatter.format(now);

    return formatted;
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
