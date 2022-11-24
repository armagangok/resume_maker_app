import '../../../../../core/export/core_export.dart';
import '../../../data/model/personal_data_model.dart';
import '../../../data/repository/personal_data_repository_imp.dart';
import '../personal_text_controllers/personal_text_controllers_cubit.dart';
import '../pick_image/pick_image_cubit.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(_getInitialPersonalModel) {
    _personalDataRepository = getIt<PersonalDataRepositoryImp>.call();
    _personalTextControllers = getIt<PersonalTextControllerCubit>.call();
    _pickImageCubit = getIt<PickImageCubit>.call();
  }

  late final PersonalTextControllerCubit _personalTextControllers;
  late final PickImageCubit _pickImageCubit;
  late final PersonalDataRepositoryImp _personalDataRepository;

  Future<void> deleteData(int index) async {
    await _personalDataRepository.deleteData(index);
  }

  Future<void> getPersonalData() async {
    var response = await _personalDataRepository.getPersonalData();

    response.fold(
      (l) {
        emit(PersonalDataCacheError());
      },
      (r) {
        r == null ? emit(state) : emit(PersonalDataReceived(personalData: r));
      },
    );
  }

  Future<void> savePersonalData(PersonalDataModel personalDataModel) async {
    var response =
        await _personalDataRepository.savePersonalData(personalDataModel);

    await getPersonalData();

    response.fold(
      (l) => emit(
        PersonalDataCacheError(),
      ),
      (r) async {
        emit(PersonalDataSaved());
        await getPersonalData();
      },
    );
  }

  PersonalDataModel preparePersonalDataModel(DataReceivedContract state) {
    var personalDataModel = PersonalDataModel(
      name: _personalTextControllers.nameController.text.isEmpty
          ? state.personalData.name
          : _personalTextControllers.nameController.text,
      location: _personalTextControllers.locationController.text.isEmpty
          ? state.personalData.location
          : _personalTextControllers.locationController.text,
      phoneNumber: _personalTextControllers.numberController.text.isEmpty
          ? state.personalData.phoneNumber
          : _personalTextControllers.numberController.text,
      email: _personalTextControllers.emailController.text.isEmpty
          ? state.personalData.email
          : _personalTextControllers.emailController.text,
      linkedin: _personalTextControllers.linkedinController.text.isEmpty
          ? state.personalData.linkedin
          : _personalTextControllers.linkedinController.text,
      birthday: _personalTextControllers.birthdayController.text.isEmpty
          ? state.personalData.birthday
          : _personalTextControllers.birthdayController.text,
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
}
