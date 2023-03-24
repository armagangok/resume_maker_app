import '../../../../core/export/export.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required this.title,
    required this.cubit,
  }) : super(key: key);

  final String title;
  final SliderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
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
                    switch ("${cubit.sliderValue.toInt()}") {
                      case "0":
                        cubit.setText = "Elemantary";
                        return const Text("Elemantary");
                      case "1":
                        cubit.setText = "Limited";
                        return const Text("Limited");
                      case "2":
                        cubit.setText = "Professional";
                        return const Text("Professional");
                      case "3":
                        cubit.setText = "Full Professional";
                        return const Text("Full Professional");
                      case "4":
                        cubit.setText = "Native";
                        return const Text("Native");
                      default:
                        cubit.setText = "";
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
                value: cubit.sliderValue.toInt().toDouble(),
                onChanged: (value) {
                  cubit.setValue(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
