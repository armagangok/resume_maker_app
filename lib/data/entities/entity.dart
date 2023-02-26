// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resume_maker_app/features/profile/presentation/cubit/slider/slider_cubit.dart';

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
