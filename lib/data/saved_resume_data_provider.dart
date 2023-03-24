import '/core/export/export.dart';

class SavedResumeDataProvider {
  SavedResumeDataProvider._();
  static final shared = SavedResumeDataProvider._();

   final _personalDataCubit = Injection.personalDataCubit;

   UserData? _userData;
   UserData? get getUserData => _userData;

    void setupControllers(UserData newUserData) {
    _personalDataCubit.fullNameController .text = newUserData.personal!.fullName!;
    _personalDataCubit.birthDayController .text = newUserData.personal!.birthday!;
    _personalDataCubit.cityController.text = newUserData.personal!.city!;
    _personalDataCubit.countryController.text = newUserData.personal!.country!;
    _personalDataCubit.emailController.text = newUserData.personal!.email!;
    _personalDataCubit.linkController.text = newUserData.personal!.link!;
    _personalDataCubit.phoneController.text = newUserData.personal!.phone!;
    _personalDataCubit.title.text = newUserData.personal!.title!;
    _personalDataCubit.summaryController.text = newUserData.personal!.summary!;
    _personalDataCubit.zipCodeController.text = newUserData.personal!.zipCode!;
     _userData = newUserData;


    Injection.educationCubit.newItems.clear();
     for (var _education in newUserData.education!) {

       var userDataEntity = UserDataEntity(
        degreeController: TextEditingController(text: _education.degree),
        majorController: TextEditingController(text: _education.major),
        startDateController: TextEditingController(text: _education.startDate),
        endDateController: TextEditingController(text: _education.endDate),
        universityController: TextEditingController(text: _education.university),
        
       );

       Injection.educationCubit.newItems.add(userDataEntity);
              
     }
   }
}