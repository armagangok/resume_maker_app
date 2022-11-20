part of 'academic_cubit.dart';

abstract class AcademicState {}

class AcademicInitial extends AcademicState {}

class CacheError extends AcademicState {}

class CachedSuccesfully extends AcademicState {}

class DataReceived extends AcademicState {}

class DataLoaded extends AcademicState {
  final List<AcademicDataModel> academicDataModel;

  DataLoaded({required this.academicDataModel});
}

class DataDeleted extends AcademicState {
  final List<AcademicDataModel> academicDataModel;

  DataDeleted({required this.academicDataModel});
}

class DataSaved extends AcademicState {}
