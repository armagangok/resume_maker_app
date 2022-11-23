part of 'experience_cubit.dart';

abstract class ExperienceState {}

class ExperienceInitial extends ExperienceState {}

class ExperienceDataReceived extends ExperienceState {
  ExperienceDataReceived({required this.experienceData});

  late final List<ExperienceModel> experienceData;
}

class ExperienceFetched extends ExperienceDataReceived {
  ExperienceFetched({required super.experienceData});
}

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
  // ExperienceDeleted({required super.experienceData});

  static const message = "Experience deleted succesfully.";
}

class ExperienceSaved extends ExperienceState {
  // ExperienceDeleted({required super.experienceData});

  static const message = "Experience saved succesfully.";
}
