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
                    hintText: "Language",
                    controller: Injection
                        .languageCubit.newItems[index].languageController!,
                  ),
                  SizedBox(height: KPadding.height5),
                  Injection.languageCubit.newItems[index].speakingSlider!,
                  SizedBox(height: KPadding.height5),
                  Injection.languageCubit.newItems[index].readingSlider!,
                  SizedBox(height: KPadding.height5),
                  Injection.languageCubit.newItems[index].writingSlider!,
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

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int initialValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            Builder(builder: (context) {
              switch ("$initialValue") {
                case "0":
                  return const Text("Elemantary");
                case "1":
                  return const Text("Limited");
                case "2":
                  return const Text("Professional");
                case "3":
                  return const Text("Full Professional");
                case "4":
                  return const Text("Full Professional");
                default:
                  return const Text("");
              }
            }),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(overlayShape: SliderComponentShape.noThumb),
          child: Slider(
              max: 4.0,
              activeColor: selectedItemColor,
              inactiveColor: white.withOpacity(0.25),
              thumbColor: white,
              value: initialValue.toDouble(),
              onChanged: (value) {
                setState(() {
                  initialValue = value.toInt();
                });
              }),
        ),
      ],
    );
  }
}
