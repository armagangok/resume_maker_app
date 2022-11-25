import 'package:flutter/material.dart';

import '../../../data/model/reference_model.dart';
import '../../../data/repository/reference_repository_imp.dart';

import '../../../../../core/export/core_export.dart';

part 'reference_state.dart';

class ReferenceCubit extends Cubit<ReferenceState> {
  ReferenceCubit({required ReferenceRepositoryImp repository})
      : super(ReferenceInitial()) {
    _repository = repository;
    _initTextControllers;
  }
  late final ReferenceRepositoryImp _repository;

  Future<void> save(ReferenceModel referenceModel) async {
    var response = await _repository.saveReferenceData(referenceModel);

    response.fold(
      (failure) {
        return emit(ReferenceSavingError());
      },
      (data) async {
        var response = await _repository.fetchReferenceData();

        response.fold(
          (failure) {
            if (failure is HiveNullData) {
              emit(ReferenceInitial());
            } else if (failure is HiveFetchFailure) {
              emit(ReferenceFetcingError());
            } else {
              emit(state);
            }
          },
          (data) async {
            emit(ReferenceFetched(referenceData: data));
          },
        );
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _repository.deleteReferenceData(index);

    response.fold(
      (l) => emit(ReferenceDeletingError()),
      (r) async {
        emit(ReferenceDeleted());
        var response = await _repository.fetchReferenceData();

        response.fold(
          (failure) {
            if (failure is HiveNullData) {
              emit(ReferenceInitial());
            } else if (failure is HiveFetchFailure) {
              emit(ReferenceFetcingError());
            } else {
              emit(state);
            }
          },
          (data) async {
            emit(ReferenceFetched(referenceData: data));
          },
        );
      },
    );
  }

  Future<void> fetchReferenceData() async {
    var response = await _repository.fetchReferenceData();

    response.fold(
      (failure) {
        if (failure is HiveNullData) {
          emit(ReferenceInitial());
        } else if (failure is HiveFetchFailure) {
          emit(ReferenceFetcingError());
        } else {
          emit(state);
        }
      },
      (data) async {
        emit(ReferenceFetched(referenceData: data));
      },
    );
  }

  //
  // TEXT CONTROLLERS

  late final TextEditingController _nameController;
  late final TextEditingController _professionController;
  late final TextEditingController _recentCompanyController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;

  TextEditingController get nameController => _nameController;
  TextEditingController get professionController => _professionController;
  TextEditingController get recentCompanyController => _recentCompanyController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneNumberController => _phoneNumberController;

  void get clearTextController {
    _nameController.clear();
    _professionController.clear();
    _recentCompanyController.clear();
    _emailController.clear();
    _phoneNumberController.clear();
  }

  void get _initTextControllers {
    _nameController = TextEditingController();
    _professionController = TextEditingController();
    _recentCompanyController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }
}
