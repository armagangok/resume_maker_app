import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:resume_maker_app/data/user_data_provider.dart';

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
              backgroundColor: selectedItemColor,
              child: Center(
                child: Icon(
                  CupertinoIcons.checkmark_alt,
                  color: white,
                  size: 35.h,
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
        dialogAction: () async {
          String pdfName = DateFormat('yyyy-MM-dd  kk.mm.ss').format(
            DateTime.now(),
          );

          var pdfPath = await Injection.previewCubit.createPdf(
            fileName: pdfName,
          );

          var encodedJson = await UserDataProvider.instance.prepareUserData(
            pdfPathToSave: pdfPath,
          );

          await Injection.rootCubit.saveUserData(encodedJson);
          await Injection.homeCubit.fetchHomeUserData();
          Injection.navigator.navigaToClear(path: homePage);
        },
      );

  PreferredSize _bottomDivider() => PreferredSize(
        preferredSize: Size.fromHeight(4.0.h),
        child: Container(
          color: iconBackground,
          height: 0.5.h,
        ),
      );

  GestureDetector _menuButton() => GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.menu_rounded,
          size: 45.h,
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
