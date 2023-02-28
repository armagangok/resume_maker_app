// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'preview_cubit.dart';

abstract class PreviewState {
  late final String _stateMessage;

  String get stateMessage;
}

class PreviewInitial extends PreviewState {
  @override
  String get stateMessage => throw UnimplementedError();
}

class PreviewLoading extends PreviewState {
  @override
  String get stateMessage => _stateMessage;
}

class PreviewLoaded extends PreviewState {
  PreviewLoaded({
    required String stateMessage,
    required this.pdfFilePath,
  }) {
    _stateMessage = stateMessage;
  }

  final String pdfFilePath;

  @override
  String get stateMessage => _stateMessage;
}

class PreviewLoadingError extends PreviewState {
  @override
  late final String _stateMessage;

  PreviewLoadingError({
    required String stateMessage,
  }) {
    _stateMessage = stateMessage;
  }

  @override
  String get stateMessage => _stateMessage;
}
