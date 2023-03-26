// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../../../core/export/export.dart';

class LanguageNewItemBuilder extends StatefulWidget {
  const LanguageNewItemBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageNewItemBuilder> createState() => _LanguageNewItemBuilderState();
}

class _LanguageNewItemBuilderState extends State<LanguageNewItemBuilder> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MultipleItemCubit, MultipleItemState>(
        bloc: Injection.languageCubit,
        builder: (context, state) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: Injection.languageCubit.newItems.length,
            itemBuilder: (context, index) => Padding(
              padding: getPadding(index),
              child: Column(
                children: [
                  UnderlinedTextField(
                    labelText: "Language",
                    controller: Injection
                        .languageCubit.newItems[index].languageController!,
                  ),
                  SizedBox(height: KPadding.height5),
                  // Injection.languageCubit.newItems[index].speakingSlider!,
                  // SizedBox(height: KPadding.height5),
                  // Injection.languageCubit.newItems[index].readingSlider!,
                  // SizedBox(height: KPadding.height5),
                  Injection.languageCubit.newItems[index].languageLevelSlider!,
                  SizedBox(height: KPadding.height30),
                  Injection.languageCubit.newItems[index].removeWidget!,
                ],
              ),
            ),
          );
        },
      );

  EdgeInsets getPadding(int index) =>
      index != 0 ? EdgeInsets.only(top: KPadding.height30) : EdgeInsets.zero;
}


// enum SliderValue {
//   elemantary,
//   limited,
//   professional,
//   fullProfessional,
// }
