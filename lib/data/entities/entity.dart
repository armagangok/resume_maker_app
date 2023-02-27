

import '../../core/export/export.dart';


class UserDataEntity {  
  final TextEditingController? degreeController;
  final TextEditingController? schoolController;
  final TextEditingController? universityController;
  final TextEditingController? startDateController;
  final TextEditingController? endDateController;
  final TextEditingController? skillsController;
  final TextEditingController? languageController;
  final TextEditingController? title;
  final TextEditingController? companyNameController;
  final TextEditingController? jobTitleController;
  final TextEditingController? jobDutiesController;
  final TextEditingController? details;
  final TextEditingController? jobStartDateController;
  final TextEditingController? jobEndDateController;

  final String? itemID;

  final Widget? removeWidget;
  final SliderWidget? speakingSlider;
  final SliderWidget? readingSlider;
  final SliderWidget? writingSlider;
  final SliderCubit? readingSliderCubit;
  final SliderCubit? writingSliderCubit;
  final SliderCubit? speakingSliderCubit;

  UserDataEntity({
    this.degreeController,
    this.schoolController,
    this.universityController,
    this.startDateController,
    this.endDateController,
    this.skillsController,
    this.languageController,
    this.title,
    this.companyNameController,
    this.jobTitleController,
    this.jobDutiesController,
    this.details,
    this.jobStartDateController,
    this.jobEndDateController,
    this.itemID,
    this.removeWidget,
    this.speakingSlider,
    this.readingSlider,
    this.writingSlider,
    this.readingSliderCubit,
    this.writingSliderCubit,
    this.speakingSliderCubit,
  });
}
