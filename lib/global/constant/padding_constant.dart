import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';

class ItemPadding extends StatelessWidget {
  const ItemPadding({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.lowPadding,
      child: widget,
    );
  }
}
