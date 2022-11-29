part of 'education_cubit.dart';

abstract class EducationState {}

class EducationInitial extends EducationState {}

class EducationDataReceived extends EducationState {
  EducationDataReceived({required this.academicDataList});

  late final List<EducationDataModel> academicDataList;
}

class EducationFetched extends EducationDataReceived {
  EducationFetched({required super.academicDataList});
}

class EducationSavingError extends EducationState {
  static const message = "Error occured while saving data.";
}

class EducationDeletingError extends EducationState {
  static const message = "Error occured while deleting data.";
}

class EducationFetchingError extends EducationState {
  static const message = "Error occured while fetching data.";
}

class EducationDeleted extends EducationState {
  // EducationDeleted({required super.skillData});

  static const message = "Education deleted succesfully.";
}

class EducationSaved extends EducationState {
  static const message = "Education saved succesfully.";
}
