part of 'project_cubit.dart';

abstract class ProjectState {}

class ProjectInitial extends ProjectState {}
class ProjectFetcingError extends ProjectState {}
class ProjectFetched extends ProjectState {}
class ProjectSaved extends ProjectState {}
class ProjectDeleted extends ProjectState {}
class ProjectDeletingError extends ProjectState {}
class ProjectSavingError extends ProjectState {}


