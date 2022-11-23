part of 'academic_cubit.dart';

abstract class AcademicState {}

class AcademicInitial extends AcademicState {}

class AcademicDataReceived extends AcademicState {
  AcademicDataReceived({required this.academicDataList});

  late final List<AcademicDataModel> academicDataList;
}

class AcademicFetched extends AcademicDataReceived {
  AcademicFetched({required super.academicDataList});
}

class AcademicSavingError extends AcademicState {
  static const message = "Error occured while saving data.";
}

class AcademicDeletingError extends AcademicState {
  static const message = "Error occured while deleting data.";
}

class AcademicFetchingError extends AcademicState {
  static const message = "Error occured while fetching data.";
}

class AcademicDeleted extends AcademicState {
  // AcademicDeleted({required super.skillData});

  static const message = "Academic deleted succesfully.";
}

class AcademicSaved extends AcademicState {
  static const message = "Academic saved succesfully.";
}
