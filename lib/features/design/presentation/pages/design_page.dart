import '../../../../core/export/export.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          _colorPickerWidget(),
          const CustomDivider(),
          const ResumeTemplateBuilder(),
        ],
      ),
    );
  }

  Widget _colorPickerWidget() {
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
