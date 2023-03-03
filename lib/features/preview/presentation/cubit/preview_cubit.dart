import 'dart:io';

import 'package:flutter/services.dart';

import '../../../../core/export/export.dart';
import '../../../../data/user_data_provider.dart';

part 'preview_state.dart';

class PreviewCubit extends Cubit<PreviewState> {
  PreviewCubit() : super(PreviewInitial());

  ResumeTemplateContract selectedTemplate = ModernTemplate.instance;

  Future loadPreview({required String pdfId}) async {
    try {
      emit(PreviewLoading());

      _selectTemplate();
      await UserDataProvider.instance.prepareUserData(
        pdfPathToSave: "",
      );

      var pdfPathToSave = await createPdf(fileName: pdfId);

      await UserDataProvider.instance.prepareUserData(
        pdfPathToSave: pdfPathToSave,
      );

      emit(
        PreviewLoaded(
          stateMessage: "Preview loadded successfully",
          pdfFilePath: UserDataProvider.instance.getUserData.pdfPath ?? "",
        ),
      );
    } catch (e) {
      emit(
        PreviewLoadingError(
          stateMessage: "$e",
        ),
      );
    }
  }

  void _selectTemplate() {
    selectedTemplate = Injection.resumeTemplateCubit.selectedTemplate;
  }

  Future<String> createPdf({required String fileName}) async {
    selectedTemplate.buildUpPDF();
    Uint8List pdfFile = await selectedTemplate.getcreatedPdfAsUint8List();
    String path = await selectedTemplate.getFilePathToSave(fileName: fileName);
    final file = File(path);
    await file.writeAsBytes(pdfFile);

    return file.path;
  }
}
