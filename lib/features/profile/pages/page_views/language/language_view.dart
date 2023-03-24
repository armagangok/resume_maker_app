import '/core/export/export.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const LanguageNewItemBuilder(),
        SizedBox(height: KPadding.height5),
        NewItemWidget(
          onTap: () {
            String itemId = Injection.languageCubit.getUniqeID();

            SliderCubit languageLevelSliderCubit = SliderCubit();

            var languageModel = LanguageModel(
              languageLevelSliderCubit: languageLevelSliderCubit,
              languageController: TextEditingController(
                text: checkIfDebugMode(text: "English"),
              ),
              itemID: itemId,
              languageLevelSlider: SliderWidget(
                title: "Level",
                cubit: languageLevelSliderCubit,
              ),
              removeWidget: RemoveNewItemWidget(
                itemID: itemId,
                cubit: Injection.languageCubit,
              ),
            );
            Injection.languageCubit.addNewItem(languageModel);
          },
        ),
      ],
    );
  }
}
