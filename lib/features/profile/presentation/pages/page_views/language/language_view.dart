import 'package:resume_maker_app/features/profile/presentation/cubit/slider/slider_cubit.dart';

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
                cubit: SliderCubit(),
              ),
              writingSlider: SliderWidget(
                title: "Writing",
                cubit: SliderCubit(),
              ),
              speakingSlider: SliderWidget(
                title: "Speaking",
                cubit: SliderCubit(),
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
