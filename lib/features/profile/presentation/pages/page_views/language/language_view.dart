import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';
import '../../../../data/models/lang_model.dart';
import '../../../widgets/remove_new_item.dart';
import '../../../widgets/slider_widget.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    print("Language View");
    return ListView(
      children: [
        const LanguageNewItemBuilder(),
        SizedBox(height: KPadding.height5),
        NewItemWidget(
          onTap: () {
            String itemId = Injection.languageCubit.getUniqeID();
            var widget = LanguageModel(
              languageController: TextEditingController(),
              itemID: itemId,
              languageCubit: Injection.languageCubit,
              readingSlider: SliderWidget(
                title: "Reading",
                cubit: Injection.readingSliderCubit,
              ),
              writingSlider: SliderWidget(
                title: "Writing",
                cubit: Injection.writingSliderCubit,
              ),
              speakingSlider: SliderWidget(
                title: "Speaking",
                cubit: Injection.speakingSliderCubit,
              ),
              removeWidget: RemoveNewItemWidget(
                itemID: itemId,
                cubit: Injection.languageCubit,
              ),
            );
            Injection.languageCubit.addNewItem(widget);
          },
        ),
      ],
    );
  }
}
