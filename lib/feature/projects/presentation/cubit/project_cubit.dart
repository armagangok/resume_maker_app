import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../../data/contract/project_repository.dart';
import '../../data/model/project_model.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit({required ProjectRepository projectRepository})
      : super(ProjectInitial()) {
    _descriptionController = TextEditingController();
    _projectNameController = TextEditingController();
    _sourceLinkController = TextEditingController();

    _projectRepo = projectRepository;
  }

  late final ProjectRepository _projectRepo;

  Future<void> save(ProjectModel projectModel) async {
    var response = await _projectRepo.saveData(
      dataModel: projectModel,
    );

    response.fold(
      (failure) {
        return emit(ProjectSavingError());
      },
      (data) async {
        var response = await _projectRepo.fetchData();

        emit(ProjectSaved());

        response.fold(
          (failure) {
            if (failure is HiveNullData) {
              emit(ProjectInitial());
            } else if (failure is HiveFetchFailure) {
              emit(ProjectFetcingError());
            } else {
              emit(state);
            }
          },
          (data) async {
            emit(ProjectFetched(experienceData: data));
          },
        );
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _projectRepo.deleteData(index);

    response.fold(
      (l) => emit(ProjectDeletingError()),
      (r) async {
        var response = await _projectRepo.fetchData();

        emit(ProjectDeleted());

        response.fold(
          (failure) {
            if (failure is HiveNullData) {
              emit(ProjectInitial());
            } else if (failure is HiveFetchFailure) {
              emit(ProjectFetcingError());
            } else {
              emit(state);
            }
          },
          (data) async {
            emit(ProjectFetched(experienceData: data));
          },
        );
      },
    );
  }

  Future<void> fetchData() async {
    var response = await _projectRepo.fetchData();

    response.fold(
      (failure) {
        if (failure is HiveNullData) {
          emit(ProjectInitial());
        } else if (failure is HiveFetchFailure) {
          emit(ProjectFetcingError());
        } else {
          emit(state);
        }
      },
      (data) async {
        emit(ProjectFetched(experienceData: data));
      },
    );
  }

  late final TextEditingController _descriptionController;
  late final TextEditingController _projectNameController;
  late final TextEditingController _sourceLinkController;

  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get projectNameController => _projectNameController;
  TextEditingController get sourceLinkController => _sourceLinkController;

  ProjectModel get getProjectModel {
    return ProjectModel(
      projectName: _projectNameController.text,
      description: _descriptionController.text,
      sourceLink: _sourceLinkController.text,
    );
  }

  void clearTextController() {
    _descriptionController.clear();
    _projectNameController.clear();
    _sourceLinkController.clear();
  }
}
