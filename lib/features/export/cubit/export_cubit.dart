import 'dart:io';

import 'package:flutter/services.dart';

import '../../../core/util/file_helper.dart';
import '/core/export/export.dart';

part 'export_state.dart';

class ExportCubit extends Cubit<ExportState> {
  ExportCubit() : super(ExportInitial());

  ResumeTemplateContract selectedTemplate = ModernTemplate.instance;

  Future exportPdf() async {
    try {
      emit(ExportLoading());

      _selectTemplate();

      UserDataProvider.prepareUserData(
        pdfPathToSave: "",
      );

      var pdfPathToSave = await createPdf(fileName: "${DateTime.now()}");

      UserDataProvider.prepareUserData(
        pdfPathToSave: pdfPathToSave,
      );

      emit(
        ExportLoaded(
          filePath: pdfPathToSave,
        ),
      );

      var response = await LauncherHelper.launchFile(pdfPathToSave);

      response.when(
        success: (data) {},
        failure: (failure) {
          emit(ExportFileLaunchingError(message: failure.message));
        },
      );
    } on PlatformException catch (e) {
      emit(
        ExportLoadingError(
          message: e.message ?? "Failed to create pdf file.",
        ),
      );
      rethrow;
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



  // Future<void> exportPdf() async {
  //   emit(ExportLoading());
  //   try {
  //     String pdfName = DateFormat('yyyy-MM-dd  kk.mm.ss').format(
  //       DateTime.now(),
  //     );

  //     UserDataProvider.prepareUserData(
  //       pdfPathToSave: "",
  //     );

  //     var pdfPath = await Injection.previewCubit.createPdf(
  //       fileName: pdfName,
  //     );

  //     UserDataProvider.prepareUserData(
  //       pdfPathToSave: pdfPath,
  //     );

  //     var encodedJson = UserDataProvider.encodeUserData();

  //     await Injection.rootCubit.saveUserData(encodedJson);
  //     await Injection.homeCubit.fetchUserData();

  //     // Injection.navigator.navigaToClear(path: homePage);

  //     emit(ExportLoaded(filePath: pdfPath));

  //     var response = await LauncherHelper.launchFile(pdfPath);

  // response.when(
  //   success: (data) {},
  //   failure: (failure) {
  //     emit(ExportFileLaunchingError(message: failure.message));
  //   },
  // );
  //   } catch (e) {
  //     emit(ExportLoadingError(message: "Filaed to create pdf file."));
  //   }
  // }