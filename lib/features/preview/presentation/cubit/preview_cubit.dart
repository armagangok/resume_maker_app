import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/pdf_maker/cloud_template.dart';
import '../../../../core/util/pdf_maker/contract/template_contract.dart';
import '../../../../core/util/pdf_maker/grey_plain_template.dart';
import '../../../../core/util/pdf_maker/peach_puff_template.dart';

part 'preview_state.dart';

class PreviewCubit extends Cubit<PreviewState> {
  PreviewCubit() : super(PreviewInitial());

  ResumeTemplateContract selectedTemplate = CloudTemplate.instance;

  void selectTemplate(int index) {
    for (var element in resumeTemplateList) {
      element.isSelected = false;
    }

    resumeTemplateList[index].isSelected = true;

    selectedTemplate = resumeTemplateList[index];
    emit(PreviewInitial());
  }

  List<ResumeTemplateContract> resumeTemplateList = [
    CloudTemplate.instance,
    GreyPlainTemplate.instance,
    PeachPuffTemplate.instance,
  ];
}
