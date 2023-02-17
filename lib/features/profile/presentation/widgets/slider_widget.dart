import '../../../../core/export/export.dart';

class SliderWidget extends StatelessWidget {
  SliderWidget(
      {Key? key,
      required this.title,
      required this.onChanged,
      required this.initialValue,
      required this.cubit})
      : super(key: key);

  final String title;
  final LanguageCubit cubit;

  final Function(String value) onChanged;
  int initialValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, MultipleItemState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Builder(
                  builder: (context) {
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
                        return const Text("Native");
                      default:
                        return const Text("");
                    }
                  },
                ),
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
                onChanged: (value) => onChanged(
                  value.toString(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
