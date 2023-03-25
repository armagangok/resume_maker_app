// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'export_cubit.dart';

abstract class ExportState {}

class ExportInitial extends ExportState {}

class ExportLoading extends ExportState {}

class ExportFileLaunchingError extends ExportState {
  final String message;
  ExportFileLaunchingError({
    required this.message,
  });
}

class ExportLoaded extends ExportState {
  final String filePath;
  ExportLoaded({
    required this.filePath,
  });
}

class ExportLoadingError extends ExportState {
  final String message;
  ExportLoadingError({
    required this.message,
  });
}
