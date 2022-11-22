import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';

class CircleAvatarWidget extends StatelessWidget {
  final Widget? widget;
  final AssetImage? assetImage;

  const CircleAvatarWidget({
    super.key,
    this.widget,
    this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: context.height(0.125),
      backgroundImage: assetImage,
      child: Center(
        child: widget,
      ),
    );
  }
}
