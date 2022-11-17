import 'package:flutter_bloc/flutter_bloc.dart';

part 'personal_detail_state.dart';

class PersonalDetailCubit extends Cubit<PersonalDetailState> {
  PersonalDetailCubit() : super(PersonalDetailInitial());
}
