import '../../../../../../../../core/export/export.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(PersonalDataInitial());

  final professionTitleController = TextEditingController();
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
