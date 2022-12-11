import 'package:flutter/material.dart';

import '../../../../data/contracts/database_contract.dart';
import '../../../../core/export/core_export.dart';
import '../../data/model/project_model.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit({required DatabaseContract repository})
      : super(ProjectInitial()) {
    _descriptionController = TextEditingController();
    _projectNameController = TextEditingController();
    _sourceLinkController = TextEditingController();

    _projectRepo = repository;
  }

  static const box = HiveBoxes.projectDataBox;

  late final DatabaseContract _projectRepo;

  Future<void> save(ProjectModel projectModel) async {
    var response = await _projectRepo.saveData<ProjectModel>(
      dataModel: projectModel,
      boxName: box,
    );

    response.fold(
      (failure) {
        return emit(ProjectSavingError());
      },
      (data) async {
        fetchData();
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _projectRepo.deleteData<ProjectModel>(
      index: index,
      boxName: box,
    );

    response.fold(
      (l) => emit(ProjectDeletingError()),
      (r) async {
        fetchData();
      },
    );
  }

  Future<void> fetchData() async {
    var response = await _projectRepo.fetchData<ProjectModel>(boxName: box);

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
