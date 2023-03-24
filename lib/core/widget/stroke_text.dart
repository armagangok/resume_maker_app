// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '/core/extension/context_extension.dart';

class StrokeText extends StatelessWidget {
  const StrokeText({
    Key? key,
    required this.text,
    required this.style,
    this.strokeColor = Colors.white,
    this.strokeWidth = 1,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final double strokeWidth;
  final Color strokeColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          style: context.bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.175,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = const Color.fromARGB(255, 188, 188, 188),
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: context.bodyLarge.copyWith(
            letterSpacing: 1.175,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
