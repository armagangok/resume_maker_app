import '/core/export/export.dart';

class DesignDataSource extends DesignDataSourceContract {
  final List<ResumeTemplateContract> _resumeTemplateList = [
    // ModernTemplate.instance,
    // CloudTemplate.instance,
    // GreyPlainTemplate.instance,
    // PeachPuffTemplate.instance,
    ClassicTemplate.instance,
  ];

  @override
  List<ResumeTemplateContract> get fetchResumeTemplates => _resumeTemplateList;

  @override
  set setNewResumeTemplate(ResumeTemplateContract newResumeTemplate) {
    _resumeTemplateList.add(newResumeTemplate);
  }
}
