import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/util/hive/hive_keys.dart';
import '../../../../../data/contracts/database_contract.dart';
import '../../../data/model/reference_model.dart';

part 'reference_state.dart';

class ReferenceCubit extends Cubit<ReferenceState> {
  ReferenceCubit({required DatabaseContract repository})
      : super(ReferenceInitial()) {
    _repository = repository;
    _initTextControllers;
  }
  late final DatabaseContract _repository;
  static const box = HiveBoxes.referenceDataBox;

  Future<void> save(ReferenceModel referenceModel) async {
    var response = await _repository.saveData<ReferenceModel>(
      dataModel: referenceModel,
      boxName: box,
    );

    response.fold(
      (failure) {
        return emit(ReferenceSavingError());
      },
      (data) async {
        emit(ReferenceSaved());
        fetchData();
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _repository.deleteData<ReferenceModel>(
        index: index, boxName: box);

    response.fold(
      (l) => emit(ReferenceDeletingError()),
      (r) async {
        emit(ReferenceDeleted());
        fetchData();
      },
    );
  }

  Future<void> fetchData() async {
    var response = await _repository.fetchData<ReferenceModel>(boxName: box);

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
