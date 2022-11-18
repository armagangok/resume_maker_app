import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/experience_model.dart';

part 'experience_state.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  ExperienceCubit() : super(ExperienceInitial());

  List<ExperienceModel> experiencesList = [];

  void addExperince(ExperienceModel experienceModel) {
    experiencesList.add(experienceModel);
    emit(AddExperience());
  }

  void removeExperience(int index) {
    experiencesList.removeAt(index);
    experiencesList.isEmpty ? emit(ExperienceInitial()) : emit(RemoveExperience());
    
  }
}
