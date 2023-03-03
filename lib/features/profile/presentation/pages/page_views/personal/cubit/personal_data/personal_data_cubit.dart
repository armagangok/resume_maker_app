import 'package:resume_maker_app/core/constant/app_constant.dart';

import '../../../../../../../../core/export/export.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(PersonalDataInitial());

  final professionTitleController = TextEditingController(
      text: checkIfDebugMode(text: "Mobile Application Developer"));
  final fullNameController = TextEditingController(
    text: checkIfDebugMode(text: "Armağan Gök"),
  );

  final birthDayController = TextEditingController(
    text: checkIfDebugMode(text: "24.11.199"),
  );
  final countryController = TextEditingController(
    text: checkIfDebugMode(text: "Turkiye"),
  );

  final zipCodeController = TextEditingController(
    text: checkIfDebugMode(text: "16290"),
  );

  final cityController = TextEditingController(
    text: checkIfDebugMode(text: "Bursa"),
  );

  final streetController = TextEditingController(
    text: checkIfDebugMode(text: "4. Akar Sokak"),
  );

  final phoneController = TextEditingController(
    text: checkIfDebugMode(text: "5454406958"),
  );

  final emailController = TextEditingController(
    text: checkIfDebugMode(text: "1armagangok@gmail.com"),
  );

  final linkController = TextEditingController(
    text: checkIfDebugMode(text: "https://linktr.ee/armagangok"),
  );

  final summaryController =
      TextEditingController(text: checkIfDebugMode(text: """
I am an eager person who is quite good at learning and teaching things. I have been making out Flutter apps for the last year and implementing Clean Architecture, MVVM, and MVC to build up my projects. I care about clean, reusable, and maintainable code.
My main goal is to start up an app business on the experiences that I have been having since 2021 in mobile application development.
Chasing bags!
"""));
}

String? checkIfDebugMode({String? text}) => kDebugMode ? text : null;
