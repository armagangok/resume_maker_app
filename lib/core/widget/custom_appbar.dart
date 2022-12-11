import 'package:flutter/material.dart';

import '../../injection_container.dart';
import '../navigation/navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.enableBackButton = true,
    this.height = kToolbarHeight,
    this.onTap,
    this.action,
    required this.onTapUpdate,
  }) : super(key: key);

  final Function onTapUpdate;
  final Widget? title;
  final bool enableBackButton;
  final double? height;
  final Function? onTap;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
          onPressed: () => onTapUpdate(),
          child: const Text(
            "Update",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
      leading: enableBackButton
          ? GestureDetector(
              onTap: onTap != null ? () => onTap!() : () => alternativeOnTap,
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            )
          : const SizedBox(),
      title: title,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);

  void get alternativeOnTap => getIt<NavigationService>().getBack();
}
