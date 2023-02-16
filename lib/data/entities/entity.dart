// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resume_maker_app/features/profile/presentation/pages/page_views/language/widget/language_item_builder.dart';

import '../../core/export/export.dart';

class UserDataEntity {
  final TextEditingController? degreeController;
  final TextEditingController? schoolController;
  final TextEditingController? universityController;
  final TextEditingController? startDateController;
  final TextEditingController? endDateController;
  final TextEditingController? skillsController;
  final TextEditingController? languageController;
  final String? itemID;
  final Widget? removeWidget;
  final SliderWidget? speakingSlider;
  final SliderWidget? readingSlider;
  final SliderWidget? writingSlider;
  final TextEditingController? title;
  final TextEditingController? companyName;
  final TextEditingController? jobTitle;
  final TextEditingController? jobDuties;
  final TextEditingController? details;
  final TextEditingController? jobStartDate;
  final TextEditingController? jobEndDate;

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
