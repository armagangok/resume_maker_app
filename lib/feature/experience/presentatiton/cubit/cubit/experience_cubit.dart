import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../data/model/experience_model.dart';
import '../../../data/repository/experience_repository_imp.dart';

part 'experience_state.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  late final ExperienceRepositoryImp _experienceRepository;

  ExperienceCubit() : super(ExperienceInitial()) {
    _experienceRepository = getIt<ExperienceRepositoryImp>.call();
  }

  List<ExperienceModel> experiencesList = [];

  void addExperince(ExperienceModel experienceModel) {
    experiencesList.add(experienceModel);
    emit(AddExperience());
  }

  void removeExperience(int index) {
    experiencesList.removeAt(index);
    experiencesList.isEmpty
        ? emit(ExperienceInitial())
        : emit(RemoveExperience());
  }
}
