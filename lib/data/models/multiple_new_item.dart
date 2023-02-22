import 'package:flutter/material.dart';
import 'package:resume_maker_app/data/entities/entity.dart';

class MultipleNewItem extends UserDataEntity {
  @override
  final TextEditingController degreeController;
  @override
  final TextEditingController schoolController;
  @override
  final TextEditingController universityController;
  @override
  final TextEditingController startDateController;
  @override
  final TextEditingController endDateController;
  @override
  final String itemID;
  @override
  final Widget removeWidget;

  MultipleNewItem({
    required this.degreeController,
    required this.schoolController,
    required this.universityController,
    required this.startDateController,
    required this.endDateController,
    required this.itemID,
    required this.removeWidget,
  });
}
