import 'package:flutter/material.dart';

class CustomFloationgButton extends StatelessWidget {
  final Function onTap;
  const CustomFloationgButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onTap(),
      child: const Icon(Icons.add),
    );
  }
}
