import 'package:flutter/material.dart';

import '../../../../core/constant/shape_constant.dart';
import '../../../../core/extension/context_extension.dart';


class TemplateItemWidget extends StatelessWidget {
  const TemplateItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height(0.18),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(radius16),
        color: Colors.white,
      ),
    );
  }
}
