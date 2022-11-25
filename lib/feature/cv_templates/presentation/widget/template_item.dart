import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';

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
