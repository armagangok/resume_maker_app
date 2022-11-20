import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_controller_state.dart';

class AcademicTextControllerCubit extends Cubit<AcademicTextControllerState> {
  AcademicTextControllerCubit() : super(AcademicTextControllerInitial()) {
    _uniController = TextEditingController();
    _gradeController = TextEditingController();
    _scholarshipController = TextEditingController();
    _majorController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
  }

  late final TextEditingController _uniController;
  late final TextEditingController _gradeController;
  late final TextEditingController _scholarshipController;
  late final TextEditingController _startDateController;
  late final TextEditingController _majorController;
  late final TextEditingController _endDateController;

  TextEditingController get uniController => _uniController;
  TextEditingController get gradeController => _gradeController;
  TextEditingController get scholarshipController => _scholarshipController;
  TextEditingController get majorController => _majorController;
  TextEditingController get startDateController => _startDateController;
  TextEditingController get endDateController => _endDateController;
}