// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'preview_cubit.dart';

abstract class PreviewState {
  late final String pdfFilePath;
}

class PreviewInitial extends PreviewState {}

class PreviewLoading extends PreviewState {}

class PreviewLoaded extends PreviewState {
  @override
  final String pdfFilePath;
  PreviewLoaded({
    required this.pdfFilePath,
  });
}

class PreviewLoadingError extends PreviewState {
  @override
  final String pdfFilePath;
  PreviewLoadingError({
    required this.pdfFilePath,
  });
}
