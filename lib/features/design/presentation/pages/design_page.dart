import '../../../../core/export/export.dart';
import '../widgets/template_color_picker_widget.dart';

class DesignPage extends StatelessWidget {
  const DesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: const [
          TemplateColorPickerWidget(),
          CustomDivider(),
          ResumeTemplateBuilder(),
        ],
      ),
    );
  }
}
