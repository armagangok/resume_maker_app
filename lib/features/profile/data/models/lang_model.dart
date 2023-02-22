// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resume_maker_app/features/profile/presentation/cubit/slider/slider_cubit.dart';

import '../../../../core/export/export.dart';
import '../../../../data/entities/entity.dart';
import '../../presentation/widgets/remove_new_item.dart';
import '../../presentation/widgets/slider_widget.dart';

class LanguageModel extends UserDataEntity {
  @override
  final TextEditingController languageController;
  @override
  final String itemID;

  @override
  RemoveNewItemWidget? removeWidget;

  @override
  final SliderWidget writingSlider;
  @override
  final SliderWidget readingSlider;
  @override
  final SliderWidget speakingSlider;

  @override
  final SliderCubit readingSliderCubit;
  @override
  final SliderCubit writingSliderCubit;
  @override
  final SliderCubit speakingSliderCubit;

  LanguageModel({
    required this.languageController,
    required this.itemID,
    required this.removeWidget,
    required this.writingSlider,
    required this.readingSlider,
    required this.speakingSlider,
    required this.readingSliderCubit,
    required this.writingSliderCubit,
    required this.speakingSliderCubit,
  });
}
