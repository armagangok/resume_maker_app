import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'experience_text_controller_state.dart';

class ExperienceTextControllerCubit
    extends Cubit<ExperienceTextControllerState> {
  ExperienceTextControllerCubit() : super(ExperienceTextControllerInitial()) {
    _companyNameController = TextEditingController();
    _professionController = TextEditingController();
    _jobStartDateController = TextEditingController();
    _jobEndDateController = TextEditingController();
    _jobRoleController = TextEditingController();
    _jobTypeController = TextEditingController();
  }

  late final TextEditingController _companyNameController;
  late final TextEditingController _professionController;
  late final TextEditingController _jobStartDateController;
  late final TextEditingController _jobEndDateController;
  late final TextEditingController _jobRoleController;
  late final TextEditingController _jobTypeController;

  TextEditingController get companyNameController => _companyNameController;
  TextEditingController get professionController => _professionController;
  TextEditingController get jobStartDateController => _jobStartDateController;
  TextEditingController get jobEndDateController => _jobEndDateController;
  TextEditingController get jobRoleController => _jobRoleController;
  TextEditingController get jobTypeController => _jobTypeController;
}
