import 'package:flutter/material.dart';

import '../../../../core/constant/shape_constant.dart';
import '../../../../core/extension/context_extension.dart';


class MenuItemWidget extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onTap;

  const MenuItemWidget({
    Key? key,
    required this.text,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: context.lowPadding,
        width: context.width(1),
        height: context.height(0.15),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: const BorderRadius.all(radius16),
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 45,
            ),
            Expanded(
              child: Text(
                text,
                style: context.textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
