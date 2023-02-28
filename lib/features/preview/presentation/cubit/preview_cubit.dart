import 'dart:io';

import 'package:flutter/services.dart';
import 'package:resume_maker_app/core/util/logger.dart';

import '../../../../core/export/export.dart';
import '../../../../data/user_data_provider.dart';

part 'preview_state.dart';

class PreviewCubit extends Cubit<PreviewState> {
  PreviewCubit() : super(PreviewInitial());

  ResumeTemplateContract selectedTemplate = ModernTemplate.instance;

  Future loadPreview({required String pdfId}) async {
    emit(PreviewLoading());
    selectedTemplate = Injection.resumeTemplateCubit.selectedTemplate;

    try {
      var pdfPathToSave = await _createPdf(pdfID: pdfId);
      await UserDataProvider.instance
          .prepareUserData(pdfPathToSave: pdfPathToSave);

      emit(
        PreviewLoaded(
          stateMessage: "Preview loadded successfully",
          pdfFilePath: UserDataProvider.instance.getUserData.pdfPath ?? "",
        ),
      );
    } catch (e) {
      rethrow;
      LogHelper.shared.debugPrint("$e");

      emit(
        PreviewLoadingError(
          stateMessage: "Error occured while loading preview.",
        ),
      );
    }
  }

  Future<String> _createPdf({required String pdfID}) async {
    selectedTemplate.buildUpPDF();
    Uint8List pdfFile = await selectedTemplate.getcreatedPdfAsUint8List();
    String path = await selectedTemplate.getFilePathToSave(pdfID);
    final file = File(path);
    await file.writeAsBytes(pdfFile);
    return file.path;
  }
}
