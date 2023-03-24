import '../../../../core/export/export.dart';

class TemplateColorPickerWidget extends StatelessWidget {
  const TemplateColorPickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPickerCubit, ColorPickerState>(
      bloc: Injection.colorPickerCubit,
      builder: (context, state) {
        return CustomTabBarWidget(
          itemCount: Injection.colorPickerCubit.resumeColors.length,
          onTap: (int index) => Injection.colorPickerCubit.selectIndex(index),
          itemList: Injection.colorPickerCubit.resumeColors,
        );
      },
    );
  }
}
