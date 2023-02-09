import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class CustomFloationgButton extends StatelessWidget {
  final Function onTap;
  const CustomFloationgButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.colors.primary,
      onPressed: () => onTap(),
      child: const Icon(Icons.add),
    );
  }
}
