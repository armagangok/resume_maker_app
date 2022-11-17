import 'package:flutter_bloc/flutter_bloc.dart';

part 'experience_state.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  ExperienceCubit() : super(ExperienceInitial());

  void addExperince() {
    emit(AddExperience());
  }

  void removeExperience() {
    emit(RemoveExperience());
  }
}
