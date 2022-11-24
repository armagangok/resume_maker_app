import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_controller_state.dart';

class ReferenceTextControllerCubit extends Cubit<ReferenceTextControllerState> {
  ReferenceTextControllerCubit() : super(TextControllerInitial()) {
    _nameController = TextEditingController();
    _professionController = TextEditingController();
    _recentCompanyController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

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
}
