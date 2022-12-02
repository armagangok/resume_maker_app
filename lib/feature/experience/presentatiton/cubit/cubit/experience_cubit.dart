import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/model/experience_model.dart';
import '../../../data/repository/experience_repository_imp.dart';

part 'experience_state.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  late final ExperienceRepoImp _experienceRepository;

  ExperienceCubit({required ExperienceRepoImp experienceRepository})
      : super(ExperienceInitial()) {
    _experienceRepository = experienceRepository;
  }

  Future<void> save(ExperienceModel experienceModel) async {
    var response = await _experienceRepository.saveData(
      dataModel: experienceModel,
    );

    response.fold(
      (failure) {
        return emit(ExperienceSavingError());
      },
      (data) async {
        var response = await _experienceRepository.fetchData();

        emit(ExperienceSaved());

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
          (data) async {
            emit(ExperienceFetched(experienceData: data));
          },
        );
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _experienceRepository.deleteData(index);

    response.fold(
      (l) => emit(ExperienceDeletingError()),
      (r) async {
        var response = await _experienceRepository.fetchData();

        emit(ExperienceDeleted());

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
          (data) async {
            emit(ExperienceFetched(experienceData: data));
          },
        );
      },
    );
  }

  Future<void> fetchExperienceData() async {
    var response = await _experienceRepository.fetchData();

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
      (data) async {
        emit(ExperienceFetched(experienceData: data));
      },
    );
  }
}
