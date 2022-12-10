part of 'project_cubit.dart';

abstract class ProjectState {}

class ProjectInitial extends ProjectState {}

class ProjectDataReceived extends ProjectState {
  ProjectDataReceived({required this.experienceData});

  late final List<ProjectModel> experienceData;
}

class ProjectFetched extends ProjectDataReceived {
  ProjectFetched({required super.experienceData});
}

class ProjectSavingError extends ProjectState {
  static const message = "Error occured while saving project data.";
}

class ProjectDeletingError extends ProjectState {
  static const message = "Error occured while deleting project data.";
}

class ProjectFetcingError extends ProjectState {
  static const message = "Error occured while fetching project data.";
}

class ProjectDeleted extends ProjectState {
  // ProjectDeleted({required super.experienceData});

  static const message = "Project deleted succesfully.";
}

class ProjectSaved extends ProjectState {
  // ProjectDeleted({required super.experienceData});

  static const message = "Project saved succesfully.";
}
