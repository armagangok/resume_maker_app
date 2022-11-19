import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'personal_text_controllers_state.dart';

class PersonalTextControllerCubit extends Cubit<PersonalTextControllerState> {
  PersonalTextControllerCubit() : super(PersonalTextControllersInitial()) {
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _emailController = TextEditingController();
    _linkedinController = TextEditingController();
    _birthdayController = TextEditingController();
    _locationController = TextEditingController();
  }

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
}
