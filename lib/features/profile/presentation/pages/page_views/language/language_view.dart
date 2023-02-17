import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';
import '../../../../data/models/lang_model.dart';
import '../../../widgets/remove_new_item.dart';
import '../../../widgets/slider_widget.dart';

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
            var widget = LanguageModel(
              languageController: TextEditingController(),
              itemID: itemId,
              languageCubit: Injection.languageCubit,
              readingSlider: SliderWidget(
                title: "Reading",
                cubit: Injection.languageCubit,
                onChanged: (val) {
                  print(val);
                  Injection.languageCubit.setReading(val);
                },
                initialValue: int.parse(Injection.languageCubit.reading),
              ),
              writingSlider: SliderWidget(
                title: "Writing",
                initialValue: int.parse(Injection.languageCubit.writing),
                cubit: Injection.languageCubit,
                onChanged: (val) {
                  print(val);
                  Injection.languageCubit.setWriting(val);
                },
              ),
              speakingSlider: SliderWidget(
                title: "Speaking",
                onChanged: (val) {
                  print(val);
                  Injection.languageCubit.setSpeaking(val);
                },
                cubit: Injection.languageCubit,
                initialValue: int.parse(Injection.languageCubit.speaking),
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
