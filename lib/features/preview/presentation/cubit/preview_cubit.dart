import 'dart:io';

import 'package:flutter/services.dart';

import '../../../../core/export/export.dart';

part 'preview_state.dart';

class PreviewCubit extends Cubit<PreviewState> {
  PreviewCubit() : super(PreviewInitial());

  ResumeTemplateContract selectedTemplate = ModernTemplate.instance;

  void selectTemplate(int index) {
    for (var element in resumeTemplateList) {
      element.isSelected = false;
    }

    resumeTemplateList[index].isSelected = true;

    selectedTemplate = resumeTemplateList[index];
    emit(PreviewInitial());
  }

  List<ResumeTemplateContract> resumeTemplateList = [
    ModernTemplate.instance,
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

        print(path);
        final file = File(path);
        await file.writeAsBytes(pdfFile);

        emit(PreviewLoaded(pdfFilePath: file.path));
      } on PlatformException {
        emit(PreviewLoadingError());
      }
    } else {
      emit(PreviewLoaded(pdfFilePath: selectedTemplate.filePath));
    }
  }
}
