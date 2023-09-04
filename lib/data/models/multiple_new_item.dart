import '../../core/export/export.dart';

class MultipleNewItem extends UserDataEntity {
  @override
  final TextEditingController degreeController;
  @override
  final TextEditingController majorController;
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
    required this.majorController,
    required this.universityController,
    required this.startDateController,
    required this.endDateController,
    required this.itemID,
    required this.removeWidget,
  });
}
