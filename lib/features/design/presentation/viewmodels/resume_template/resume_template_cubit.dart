import '../../../../../core/export/export.dart';

part 'resume_template_state.dart';

class ResumeTemplateCubit extends Cubit<ResumeTemplateState> {
  ResumeTemplateCubit() : super(ResumeTemplateInitial());

  ResumeTemplateContract selectedTemplate = ModernTemplate.instance;

  List<ResumeTemplateContract> resumeTemplateList = [
    ModernTemplate.instance,
    CloudTemplate.instance,
    GreyPlainTemplate.instance,
    PeachPuffTemplate.instance,
  ];

  void selectTemplate(int index) {
    for (var element in resumeTemplateList) {
      element.isSelected = false;
    }

    resumeTemplateList[index].isSelected = true;

    selectedTemplate = resumeTemplateList[index];
    emit(ResumeTemplateInitial());
  }
}
