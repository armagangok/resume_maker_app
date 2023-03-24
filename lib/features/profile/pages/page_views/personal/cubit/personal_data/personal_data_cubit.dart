import '../../../../../../../../core/export/export.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit(
    
  ) : super(PersonalDataInitial());
  

  final professionController = TextEditingController();
  final fullNameController = TextEditingController();
  final birthDayController = TextEditingController();
  final countryController = TextEditingController();
  final zipCodeController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final linkController = TextEditingController();
  final summaryController = TextEditingController();

  
}

String checkIfDebugMode({required String text}) => kDebugMode ? text : "";


// """
// I am an eager person who is quite good at learning and teaching things. I have been making out Flutter apps for the last year and implementing Clean Architecture, MVVM, and MVC to build up my projects. I care about clean, reusable, and maintainable code.
// My main goal is to start up an app business on the experiences that I have been having since 2021 in mobile application development.
// Chasing bags!
// """