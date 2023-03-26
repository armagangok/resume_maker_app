import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '/core/export/export.dart';

class TemplateColorPickerWidget extends StatefulWidget {
  const TemplateColorPickerWidget({
    super.key,
  });

  @override
  State<TemplateColorPickerWidget> createState() =>
      _TemplateColorPickerWidgetState();
}

class _TemplateColorPickerWidgetState extends State<TemplateColorPickerWidget> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPickerCubit, ColorPickerState>(
      bloc: Injection.colorPickerCubit,
      builder: (context, state) {
        return ColorTabBarWidget(
          itemCount: Injection.colorPickerCubit.resumeColors.length,
          onTap: (int index) => Injection.colorPickerCubit.selectIndex(
            index,
          ),
          itemList: Injection.colorPickerCubit.resumeColors,
        );
      },
    );
  }
}
