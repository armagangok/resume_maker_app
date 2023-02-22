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
    return ListView(
      children: [
        const LanguageNewItemBuilder(),
        SizedBox(height: KPadding.height5),
        NewItemWidget(
          onTap: () {
            String itemId = Injection.languageCubit.getUniqeID();

            SliderCubit readingCubit = SliderCubit();
            SliderCubit writingCubit = SliderCubit();
            SliderCubit speakingCubit = SliderCubit();

            var languageModel = LanguageModel(
              readingSliderCubit: readingCubit,
              writingSliderCubit: writingCubit,
              speakingSliderCubit: speakingCubit,
              languageController: TextEditingController(),
              itemID: itemId,
              
              readingSlider: SliderWidget(
                title: "Reading",
                cubit: readingCubit,
              ),
              writingSlider: SliderWidget(
                title: "Writing",
                cubit: writingCubit,
              ),
              speakingSlider: SliderWidget(
                title: "Speaking",
                cubit: speakingCubit,
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
