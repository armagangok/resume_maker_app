import 'package:flutter/material.dart';

import '../../../../core/constant/shape_constant.dart';
import '../../../../core/extension/context_extension.dart';

class HomeContainerWidget extends StatelessWidget {
  const HomeContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        width: context.width(1),
        height: context.height(0.25),
        decoration: BoxDecoration(
          color: context.primary,
          borderRadius: const BorderRadius.only(
            bottomRight: radius25,
            bottomLeft: radius25,
          ),
        ),
        child: Center(
          child: Text(
            "Resume Maker!",
            style: context.textTheme.headlineMedium!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
