// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resume_maker_app/data/entities/entity.dart';

import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';
import '../../../widgets/remove_new_item.dart';
import 'widget/language_item_builder.dart';

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
              readingSlider: const SliderWidget(title: "Reading"),
              writingSlider: const SliderWidget(title: "Writing"),
              speakingSlider: const SliderWidget(title: "Speaking"),
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

  LanguageModel({
    required this.languageController,
    required this.itemID,
    required this.removeWidget,
    required this.writingSlider,
    required this.readingSlider,
    required this.speakingSlider,
  });
}
