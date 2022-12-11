import 'package:flutter/material.dart';

import '../export/core_export.dart';

Future<dynamic> customBottomSheet({
  required BuildContext context,
  required Widget widget,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => SizedBox(
      height: context.height(0.75),
      child: widget,
    ),
  );
}
