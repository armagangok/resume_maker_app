import '../../../../core/export/export.dart';
import '../../../../core/widget/custom_tab_bar.dart';
import '../cubit/design_cubit.dart';
import '../widgets/resume_list_view.dart';

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
    return BlocBuilder<DesignCubit, DesignState>(
      bloc: Injection.designCubit,
      builder: (context, state) {
        return CustomTabBarWidget(
          itemCount: Injection.designCubit.resumeColors.length,
          onTap: (int index) => Injection.designCubit.selectIndex(index),
          itemList: Injection.designCubit.resumeColors,
        );
      },
    );
  }
}
