import 'package:flutter/material.dart';

class InitialStateWidget extends StatelessWidget {
  final String text;

  const InitialStateWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
