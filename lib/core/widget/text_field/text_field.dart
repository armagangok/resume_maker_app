// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import '../../export/export.dart';

class UnderlinedTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  final int? maxLines;
  final double? heigth;

  const UnderlinedTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.maxLines = 1,
    this.heigth = 45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth?.h,
      child: TextField(
        style: context.bodyMedium,
        textAlignVertical: TextAlignVertical.top,
        // scrollPadding: EdgeInsets.zero,
        controller: controller,
        cursorColor: white,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 0,
          ),
          labelText: labelText,
          floatingLabelStyle: context.bodySmall.copyWith(
            fontSize: 15,
            color: const Color.fromARGB(
              255,
              130,
              130,
              130,
            ),
          ),
          // hintStyle: const TextStyle(
          //   color: Colors.white,
          // ), // inactive label text color
        ),
      ),
    );
  }
}

class RemovableTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function onTapRemoveButton;
  final String? helperText;

  const RemovableTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onTapRemoveButton,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextField(
        style: context.bodyMedium,
        textAlignVertical: TextAlignVertical.top,
        // scrollPadding: EdgeInsets.zero,
        controller: controller,
        cursorColor: white,
        decoration: InputDecoration(
          hintText: hintText,
          helperText: helperText,
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 40.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => onTapRemoveButton(),
                child: const Icon(
                  CupertinoIcons.minus_circle_fill,
                  color: deleteRedColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
