import 'dart:io';

import 'package:flutter/services.dart';

import '../../../../core/export/export.dart';

part 'preview_state.dart';

class PreviewCubit extends Cubit<PreviewState> {
  PreviewCubit() : super(PreviewInitial());

  ResumeTemplateContract selectedTemplate = ModernTemplate.instance;

  Future loadPreview() async {
    emit(PreviewLoading());
    selectedTemplate = Injection.resumeTemplateCubit.selectedTemplate;
    print(selectedTemplate.filePath);
    if (selectedTemplate.filePath.isEmpty) {
      try {
        var path = await createPdf("preview");
        emit(PreviewLoaded(pdfFilePath: path));
      } on PlatformException {
        emit(PreviewLoadingError());
      }
    } else {
      emit(PreviewLoaded(pdfFilePath: selectedTemplate.filePath));
    }
  }

  Future<String> createPdf(String pdfID) async {
    selectedTemplate.buildUpPDF();
    Uint8List pdfFile = await selectedTemplate.getcreatedPdf();
    String path = await selectedTemplate.getFilePathToSave(pdfID);
    final file = File(path);
    await file.writeAsBytes(pdfFile);
    return file.path;
  }
}
