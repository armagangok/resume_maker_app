// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.color,
    this.borderColor = Colors.transparent,
    this.child,
    this.borderRadius,
    // this.border,
    this.padding,
    this.gradient,
    this.enableShadow = true,
  }) : super(key: key);

  final Color? color;
  // final Border? border ;
  final Color borderColor;
  final Widget? child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final bool enableShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient,
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(40),
        border: Border.all(
          color: borderColor,
        ),
        boxShadow: enableShadow == true
            ? [
                const BoxShadow(
                  // color: Colors.grey.withOpacity(0.5),

                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(3, 3), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
