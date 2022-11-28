import 'package:flutter/material.dart';

import '../../../../../core/export/core_export.dart';
import '../../../data/contract/personal_data_repository.dart';
import '../../../export/personal_export.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit({
    required PersonalDataRepository personalDataRepository,
    required PickImageCubit pickImageCubit,
  }) : super(_getInitialPersonalModel) {
    _personalDataRepository = personalDataRepository;
    _pickImageCubit = pickImageCubit;

    _initTextController();
  }

  void _initTextController() {
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _emailController = TextEditingController();
    _linkedinController = TextEditingController();
    _birthdayController = TextEditingController();
    _locationController = TextEditingController();
  }

  late final PickImageCubit _pickImageCubit;
  late final PersonalDataRepository _personalDataRepository;

  Future<void> deleteData(int index) async {
    await _personalDataRepository.deleteData(index);
  }

  Future<void> fetchPersonalData() async {
    var response = await _personalDataRepository.fetchPersonalData();

    response.fold(
      (l) {
        if (l is HiveNullData) {
          emit(_getInitialPersonalModel);
        } else {
          emit(PersonalDataFetchError());
        }
      },
      (r) {
        emit(PersonalDataReceived(personalData: r));
      },
    );
  }

  Future<void> savePersonalData(PersonalDataModel personalDataModel) async {
    var response =
        await _personalDataRepository.savePersonalData(personalDataModel);

    await fetchPersonalData();

    response.fold(
      (l) => emit(
        PersonalDataSaveError(),
      ),
      (r) async {
        emit(PersonalDataSaved());
        await fetchPersonalData();
      },
    );
  }

  PersonalDataModel preparePersonalDataModel(DataReceivedContract state) {
    var personalDataModel = PersonalDataModel(
      name: _nameController.text.isEmpty
          ? state.personalData.name
          : _nameController.text,
      location: _locationController.text.isEmpty
          ? state.personalData.location
          : _locationController.text,
      phoneNumber: _numberController.text.isEmpty
          ? state.personalData.phoneNumber
          : _numberController.text,
      email: _emailController.text.isEmpty
          ? state.personalData.email
          : _emailController.text,
      linkedin: _linkedinController.text.isEmpty
          ? state.personalData.linkedin
          : _linkedinController.text,
      birthday: _birthdayController.text.isEmpty
          ? state.personalData.birthday
          : _birthdayController.text,
      imagePath: _pickImageCubit.getChoosenImagePath.isEmpty
          ? state.personalData.imagePath
          : _pickImageCubit.getChoosenImagePath,
    );
    return personalDataModel;
  }

  static PersonalDataInitial get _getInitialPersonalModel =>
      PersonalDataInitial(
        personalData: PersonalDataModel(
          birthday: "Birthday",
          email: "Email",
          imagePath: "",
          linkedin: "Linkedin",
          location: "Location",
          name: "Name",
          phoneNumber: "Phone Number",
        ),
      );

  late final TextEditingController _nameController;
  late final TextEditingController _numberController;
  late final TextEditingController _emailController;
  late final TextEditingController _linkedinController;
  late final TextEditingController _birthdayController;
  late final TextEditingController _locationController;

  TextEditingController get nameController => _nameController;
  TextEditingController get numberController => _numberController;
  TextEditingController get emailController => _emailController;
  TextEditingController get linkedinController => _linkedinController;
  TextEditingController get birthdayController => _birthdayController;
  TextEditingController get locationController => _locationController;

  void clearControllers() {
    _nameController.clear();
    _numberController.clear();
    _emailController.clear();
    _linkedinController.clear();
    _birthdayController.clear();
    _locationController.clear();
  }

  bool checkControllersIfEmpty() {
    return (_nameController.text.isEmpty &&
            _numberController.text.isEmpty &&
            _emailController.text.isEmpty &&
            _linkedinController.text.isEmpty &&
            _birthdayController.text.isEmpty &&
            _locationController.text.isEmpty)
        ? true
        : false;
  }
}
