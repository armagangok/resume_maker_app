part of 'experience_cubit.dart';

abstract class ExperienceState {}

class ExperienceInitial extends ExperienceState {}

class ExperienceFetched extends ExperienceState {}

class ExperienceRemoved extends ExperienceState {}

class ExperienceSavingError extends ExperienceState {
  static const message = "Error occured while saving data.";
}

class ExperienceDeletingError extends ExperienceState {
  static const message = "Error occured while deleting data.";
}

class ExperienceFetcingError extends ExperienceState {
  static const message = "Error occured while fetching data.";
}

class ExperienceDeleted extends ExperienceState {
  static const message = "Experience deleted succesfully.";
}
