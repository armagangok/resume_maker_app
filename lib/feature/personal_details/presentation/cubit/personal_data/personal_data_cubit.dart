import 'package:flutter/material.dart';

import '../../../../../core/export/core_export.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit({
    required DatabaseContract repository,
    required PickImageCubit imagePickerCubit,
  }) : super(_getInitialPersonalModel) {
    _personalDataRepository = repository;
    _imagePickerCubit = imagePickerCubit;

    _initTextController();
  }

  late final DatabaseContract _personalDataRepository;
  late final PickImageCubit _imagePickerCubit;

  static const box = HiveBoxes.personalDataBox;

  Future<void> deleteData(int index) async {
    await _personalDataRepository.deleteData(index: index, boxName: box);
  }

  Future<void> fetchPersonalData() async {
    var response = await _personalDataRepository.fetchData<PersonalDataModel>(
      boxName: box,
    );

    response.fold(
      (l) {
        if (l is HiveNullData) {
          emit(_getInitialPersonalModel);
        } else {
          emit(PersonalDataFetchError());
        }
      },
      (r) {
        print(r);
        emit(PersonalDataReceived(personalData: r[0]));
      },
    );
  }

  Future<void> savePersonalData(PersonalDataModel personalDataModel) async {
    var response = await _personalDataRepository.saveData<PersonalDataModel>(
      dataModel: personalDataModel,
      boxName: box,
    );

    await fetchPersonalData();

    response.fold(
      (l) => emit(PersonalDataSaveError()),
      (r) async {
        emit(PersonalDataSaved());
        await fetchPersonalData();
      },
    );
  }

  PersonalDataModel preparePersonalDataModel(DataReceivedContract state) {
    var imagePath2 = state.personalData.imagePath;
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
      imagePath:
          imagePath2.isEmpty ? _imagePickerCubit.getImageFile.path : imagePath2,
      aboutMeText: _aboutMeController.text.isEmpty
          ? state.personalData.aboutMeText
          : _aboutMeController.text,
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
            aboutMeText: "About Me"),
      );

  //
  // TEXT CONTROLLERS
  //

  late final TextEditingController _nameController;
  late final TextEditingController _numberController;
  late final TextEditingController _emailController;
  late final TextEditingController _linkedinController;
  late final TextEditingController _birthdayController;
  late final TextEditingController _locationController;
  late final TextEditingController _aboutMeController;

  TextEditingController get nameController => _nameController;
  TextEditingController get numberController => _numberController;
  TextEditingController get emailController => _emailController;
  TextEditingController get linkedinController => _linkedinController;
  TextEditingController get birthdayController => _birthdayController;
  TextEditingController get locationController => _locationController;
  TextEditingController get aboutMeController => _aboutMeController;

  void _initTextController() {
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _emailController = TextEditingController();
    _linkedinController = TextEditingController();
    _birthdayController = TextEditingController();
    _locationController = TextEditingController();
    _aboutMeController = TextEditingController();
  }

  void clearControllers() {
    _nameController.clear();
    _numberController.clear();
    _emailController.clear();
    _linkedinController.clear();
    _birthdayController.clear();
    _locationController.clear();
    _aboutMeController.clear();
  }

  bool checkControllersIfEmpty() {
    return (_nameController.text.isEmpty &&
            _numberController.text.isEmpty &&
            _emailController.text.isEmpty &&
            _linkedinController.text.isEmpty &&
            _birthdayController.text.isEmpty &&
            _locationController.text.isEmpty &&
            aboutMeController.text.isEmpty)
        ? true
        : false;
  }
}
