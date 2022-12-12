import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/pdf_maker/cloud_template.dart';
import '../../../../core/util/pdf_maker/grey_plain_template.dart';
import '../../../../core/util/pdf_maker/peach_puff_template.dart';
import '../../../../injection_container.dart';

part 'cv_templates_state.dart';

class TemplatesCubit extends Cubit<TemplateState> {
  TemplatesCubit() : super(TemplateInitial()) {
    _greyPlainTemplate = getIt<GreyPlainTemplate>.call();
    _peachPuffTemplate = getIt<PeachPuffTemplate>.call();
    _cloudTemplate = getIt<CloudTemplate>.call();
  }

  late final PeachPuffTemplate _peachPuffTemplate;
  late final GreyPlainTemplate _greyPlainTemplate;
  late final CloudTemplate _cloudTemplate;

  Future<void> createCloudPdf() async {
    try {
      _cloudTemplate.buildUpPDF();
      emit(PdfIsBeingCreatedState());
      final pdf = await _cloudTemplate.createPdf();
      await _cloudTemplate.savePdfFile("cloudTest", pdf);
      emit(PdfCreatedState());
    } catch (e) {
      emit(PdfErrorState(errorMessage: "$e"));
      rethrow;
    }
  }

  Future<void> createPeachPuffPdf() async {
    try {
      emit(PdfIsBeingCreatedState());
      final pdf = await _peachPuffTemplate.createPdf();
      await _peachPuffTemplate.savePdfFile("peachPuffTest", pdf);
      emit(PdfCreatedState());
    } catch (e) {
      emit(PdfErrorState(errorMessage: "$e"));
      rethrow;
    }
  }

  Future<void> createGreyPdf() async {
    try {
      emit(PdfIsBeingCreatedState());
      final pdf = await _greyPlainTemplate.createPdf();
      await _greyPlainTemplate.savePdfFile("greyTest", pdf);
      emit(PdfCreatedState());
    } catch (e) {
      emit(PdfErrorState(errorMessage: "$e"));
      rethrow;
    }
  }
}
