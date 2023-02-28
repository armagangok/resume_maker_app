import '../../../../core/export/export.dart';

abstract class DesignDataSourceContract {
  List<ResumeTemplateContract> get fetchResumeTemplates;
  set setNewResumeTemplate(ResumeTemplateContract resumeTemplateContract);
}
