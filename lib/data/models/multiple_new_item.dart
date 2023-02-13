import 'package:flutter/material.dart';

class MultipleNewItem {
  final TextEditingController degreeController;
  final TextEditingController schoolController;
  final TextEditingController universityController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  int itemID;
  final Widget deleteWidget;

  MultipleNewItem({
    required this.degreeController,
    required this.schoolController,
    required this.universityController,
    required this.startDateController,
    required this.endDateController,
    required this.itemID,
    required this.deleteWidget,
  });
}
