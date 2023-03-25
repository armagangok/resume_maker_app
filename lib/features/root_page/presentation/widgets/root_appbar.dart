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

  IosChoiceDialog dialogWidget() => IosChoiceDialog(
    title: "Warning",
        message: "Do you wish to save your changes?",
    action1: DialogAction(
      actionText: "Save", 
      action: () async {
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
      }
    ),

    action2: DialogAction(
      actionText:"Don't Save", 
      action: () {
        Injection.navigator.navigaToClear(path: homePage);
      }
    ),

    action3: DialogAction(
      actionText: "Get Back",
      action: () {
        Injection.navigator.pop();
      },
    ),
        
  );

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
