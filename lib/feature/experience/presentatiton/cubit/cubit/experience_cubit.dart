import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_maker_app/core/error/failure.dart';

import '../../../../../injection_container.dart';
import '../../../data/model/experience_model.dart';
import '../../../data/repository/experience_repository_imp.dart';

part 'experience_state.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  late final ExperienceRepositoryImp _repository;

  ExperienceCubit() : super(ExperienceInitial()) {
    _repository = getIt<ExperienceRepositoryImp>.call();
  }

  List<ExperienceModel> experiencesList = [];

  Future<void> save(ExperienceModel experienceModel) async {
    var response = await _repository.savePersonalData(experienceModel);

    response.fold(
      (failure) {
        return emit(ExperienceSavingError());
      },
      (data) {
        experiencesList.add(experienceModel);
        emit(ExperienceFetched());
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _repository.deleteData(index);

    response.fold(
      (l) => emit(ExperienceDeletingError()),
      (r) => emit(state),
    );

    experiencesList.removeAt(index);
    experiencesList.isEmpty
        ? emit(ExperienceInitial())
        : emit(ExperienceRemoved());
  }

  Future<void> fetchExperienceData() async {
    var response = await _repository.fetchExperienceData();

    response.fold(
      (failure) {
        if (failure is HiveNullData) {
          emit(ExperienceInitial());
        } else if (failure is HiveFetchFailure) {
          emit(ExperienceFetcingError());
        } else {
          emit(state);
        }
      },
      (data) {
        emit(ExperienceFetched());
        return data;
      },
    );
  }
}
