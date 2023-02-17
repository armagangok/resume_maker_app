import '../../core/export/export.dart';
import '../../features/profile/presentation/widgets/slider_widget.dart';

class UserDataEntity {
  final TextEditingController? degreeController;
  final TextEditingController? schoolController;
  final TextEditingController? universityController;
  final TextEditingController? startDateController;
  final TextEditingController? endDateController;
  final TextEditingController? skillsController;
  final TextEditingController? languageController;
  final TextEditingController? title;
  final TextEditingController? companyName;
  final TextEditingController? jobTitle;
  final TextEditingController? jobDuties;
  final TextEditingController? details;
  final TextEditingController? jobStartDate;
  final TextEditingController? jobEndDate;

  final String? itemID;

  final Widget? removeWidget;
  final SliderWidget? speakingSlider;
  final SliderWidget? readingSlider;
  final SliderWidget? writingSlider;

  UserDataEntity({
    this.degreeController,
    this.schoolController,
    this.universityController,
    this.startDateController,
    this.endDateController,
    this.skillsController,
    this.languageController,
    this.itemID,
    this.removeWidget,
    this.speakingSlider,
    this.readingSlider,
    this.writingSlider,
    this.title,
    this.companyName,
    this.jobTitle,
    this.jobDuties,
    this.details,
    this.jobStartDate,
    this.jobEndDate,
  });
}
