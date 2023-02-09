// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;

  final double size;

  const MyIconButton({
    Key? key,
    required this.icon,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        size: size,
        icon,
      ),
    );
  }
}
