import '/core/export/export.dart';

class LanguageModel extends UserDataEntity {
  @override
  final TextEditingController languageController;
  @override
  final String itemID;

  @override
  RemoveNewItemWidget? removeWidget;

  @override
  final SliderWidget languageLevelSlider;
  @override
  // final SliderWidget readingSlider;
  // @override
  // final SliderWidget speakingSlider;

  @override
  final SliderCubit languageLevelSliderCubit;
  // @override
  // final SliderCubit writingSliderCubit;
  // @override
  // final SliderCubit speakingSliderCubit;

  LanguageModel({
    required this.languageController,
    required this.itemID,
    required this.removeWidget,
    required this.languageLevelSlider,
    // required this.readingSlider,
    // required this.speakingSlider,
    required this.languageLevelSliderCubit,
    // required this.writingSliderCubit,
    // required this.speakingSliderCubit,
  });
}
