import 'package:flutter/cupertino.dart';

import '../../../export/export.dart';

class UnderlinedTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  String? helperText;

  UnderlinedTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        // scrollPadding: EdgeInsets.zero,
        controller: controller,
        cursorColor: white,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 0,
          ),
          hintText: hintText,
          helperText: helperText,
        ),
      ),
    );
  }
}

class RemovableTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  final Function onTapRemoveButton;

  String? helperText;

  RemovableTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onTapRemoveButton,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
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
