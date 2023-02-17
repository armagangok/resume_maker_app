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
  final LanguageCubit languageCubit;
  @override
  RemoveNewItemWidget? removeWidget;

  @override
  final SliderWidget writingSlider;
  @override
  final SliderWidget readingSlider;
  @override
  final SliderWidget speakingSlider;

  LanguageModel({
    required this.languageController,
    required this.itemID,
    required this.removeWidget,
    required this.writingSlider,
    required this.readingSlider,
    required this.speakingSlider,
    required this.languageCubit,
  });
}
