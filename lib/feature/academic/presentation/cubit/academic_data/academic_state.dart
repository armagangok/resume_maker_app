part of 'academic_cubit.dart';

abstract class AcademicState {
  late final List<AcademicDataModel> dataList;
}

class AcademicInitial extends AcademicState {}

class CacheError extends AcademicState {}

class DataReceived extends AcademicState {
  @override
  late final List<AcademicDataModel> dataList;
  DataReceived({required this.dataList});
}

class DataSaved extends AcademicState {
  @override
  late final List<AcademicDataModel> dataList;

  DataSaved({required this.dataList});
}

class DataDeleted extends AcademicState {
  @override
  late final List<AcademicDataModel> dataList;

  DataDeleted({required this.dataList});
}
