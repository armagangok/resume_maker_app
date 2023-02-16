// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../core/export/export.dart';

class ModelEntity {
  final TextEditingController? degreeController;
  final TextEditingController? schoolController;
  final TextEditingController? universityController;
  final TextEditingController? startDateController;
  final TextEditingController? endDateController;
  final String? itemID;
  final Widget? removeWidget;
  final TextEditingController? title;
  final TextEditingController? details;

  ModelEntity({
    this.degreeController,
    this.schoolController,
    this.universityController,
    this.startDateController,
    this.endDateController,
    this.itemID,
    this.removeWidget,
    this.title,
    this.details,
  });
}
