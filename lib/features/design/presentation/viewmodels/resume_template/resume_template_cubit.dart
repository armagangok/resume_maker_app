// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../core/export/export.dart';

part 'resume_template_state.dart';

class ResumeTemplateCubit extends Cubit<ResumeTemplateState> {
  ResumeTemplateCubit({
    required this.resumeTemplateSource,
  }) : super(ResumeTemplateInitial()) {
    _resumeTemplateList = resumeTemplateSource.fetchResumeTemplates;
  }

  List<ResumeTemplateContract> _resumeTemplateList = [];
  List<ResumeTemplateContract> get resumeTemplateList => _resumeTemplateList;

  late final DesignDataSourceContract resumeTemplateSource;

  ResumeTemplateContract selectedTemplate = ModernTemplate.instance;

  void selectTemplate(int index) {
    for (var element in _resumeTemplateList) {
      element.isSelected = false;
    }

    _resumeTemplateList[index].isSelected = true;

    selectedTemplate = _resumeTemplateList[index];
    emit(ResumeTemplateInitial());
  }
}
