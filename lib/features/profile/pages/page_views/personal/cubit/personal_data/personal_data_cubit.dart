import '../../../../../../../../core/export/export.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(PersonalDataInitial());

  final title = TextEditingController(
    text: kDebugMode ? "Mobile Application Developer" : null,
  );

  final fullNameController = TextEditingController(
    text: kDebugMode ? "Armağan Gök" : null,
  );
  final birthDayController = TextEditingController(
    text: kDebugMode ? "24.11.1999" : null,
  );
  final countryController = TextEditingController(
    text: kDebugMode ? "Turkiye" : null,
  );
  final zipCodeController = TextEditingController(
    text: kDebugMode ? "16310" : null,
  );
  final cityController = TextEditingController(
    text: kDebugMode ? "Bursa" : null,
  );
  final streetController = TextEditingController(
    text: kDebugMode ? "Profesör Tezok Caddesi" : null,
  );
  final phoneController = TextEditingController(
    text: kDebugMode ? "+90 545 440 6958" : null,
  );
  final emailController = TextEditingController(
    text: kDebugMode ? "1armagangok@gmail.com" : null,
  );
  final linkController = TextEditingController(
    text: kDebugMode ? "https://linktr.ee/armagangok" : null,
  );
  final summaryController = TextEditingController(
    text: kDebugMode
        ? """I am an eager person who is quite good at learning and teaching things. I have been making out Flutter apps for the last year and implementing Clean Architecture, MVVM, and MVC to build up my projects. I care about clean, reusable, and maintainable code.
My main goal is to start up an app business on the experiences that I have been having since 2021 in mobile application development."""
        : null,
  );
}
