// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'preview_cubit.dart';

abstract class PreviewState {}

class PreviewInitial extends PreviewState {}

class PreviewLoading extends PreviewState {}

class PreviewLoaded extends PreviewState {
  @override
  final String pdfFilePath;

  static get stateMessage => "Preview loadded successfully";

  PreviewLoaded({
    required this.pdfFilePath,
  });
}

class PreviewLoadingError extends PreviewState {
  static get stateMessage => "Error Occured while loading preview.";
}
