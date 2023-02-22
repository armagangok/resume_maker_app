import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/export/export.dart';

import '../../../../core/util/pdf_maker/contract/template_contract.dart';



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

  void loadPreview() async {
    emit(PreviewLoading());
    if (selectedTemplate.filePath.isEmpty) {
      try {
        selectedTemplate.buildUpPDF();
        Uint8List pdfFile = await selectedTemplate.getcreatedPdf();
        String path = await selectedTemplate.getFilePathToSave();
        final file = File(path);
        await file.writeAsBytes(pdfFile);

        emit(PreviewLoaded(pdfFilePath: PreviewLoaded.message));
      } catch (e) {
        emit(PreviewLoadingError(pdfFilePath: "Error while loading PDF"));
      }
    } else {
      emit(PreviewLoaded(pdfFilePath: selectedTemplate.filePath));
    }
  }
}
