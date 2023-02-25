import '../../../../core/export/export.dart';

class DesignDataSource extends DesignDataSourceContract {
  final List<ResumeTemplateContract> _resumeTemplateList = [
    ModernTemplate.instance,
    CloudTemplate.instance,
    GreyPlainTemplate.instance,
    PeachPuffTemplate.instance,
  ];

  @override
  List<ResumeTemplateContract> get fetchResumeTemplates => _resumeTemplateList;
}
