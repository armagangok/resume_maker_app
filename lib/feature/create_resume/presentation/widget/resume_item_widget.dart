import 'package:flutter/material.dart';

import '../../../../core/constant/shape_constant.dart';
import '../../../../core/extension/context_extension.dart';

class ResumeItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onTap;

  const ResumeItem({
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
        height: context.height(0.12),
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: const BorderRadius.all(radius16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: context.textTheme.bodyLarge!.copyWith(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Container(
              height: context.height(0.11),
              width: context.height(0.11),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(radius16),
              ),
              child: Icon(
                iconData,
                color: Colors.blueGrey[900],
                size: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
