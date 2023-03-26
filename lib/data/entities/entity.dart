// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../core/export/export.dart';

class UserDataEntity {
  final TextEditingController? degreeController;
  final TextEditingController? majorController;
  final TextEditingController? universityController;
  final TextEditingController? startDateController;
  final TextEditingController? endDateController;
  final TextEditingController? skillsController;
  final TextEditingController? languageController;
  final TextEditingController? title;
  final TextEditingController? companyNameController;
  final TextEditingController? jobTitleController;
  final TextEditingController? jobDutiesController;
  final TextEditingController? description;
  final TextEditingController? jobStartDateController;
  final TextEditingController? jobEndDateController;
  final TextEditingController? voluntaryTitle;
  final TextEditingController? voluntaryDescription;

  final String? itemID;
  final Widget? removeWidget;
  final SliderWidget? speakingSlider;
  final SliderWidget? readingSlider;
  final SliderWidget? languageLevelSlider;
  final SliderCubit? languageLevelSliderCubit;

  UserDataEntity({
    this.degreeController,
    this.majorController,
    this.universityController,
    this.startDateController,
    this.endDateController,
    this.skillsController,
    this.languageController,
    this.title,
    this.companyNameController,
    this.jobTitleController,
    this.jobDutiesController,
    this.description,
    this.jobStartDateController,
    this.jobEndDateController,
    this.voluntaryTitle,
    this.voluntaryDescription,
    this.itemID,
    this.removeWidget,
    this.speakingSlider,
    this.readingSlider,
    this.languageLevelSlider,
    this.languageLevelSliderCubit,
  });
}
