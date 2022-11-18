import 'package:flutter/material.dart';

Future<dynamic> customBottomSheet({
  required BuildContext context,
  required Widget widget,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => widget,
  );
}
