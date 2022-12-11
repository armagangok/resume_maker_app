import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/util/hive/hive_keys.dart';
import '../../../../../data/contracts/database_contract.dart';
import '../../../data/model/experience_model.dart';

part 'experience_state.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  late final DatabaseContract _experienceRepository;

  ExperienceCubit({required DatabaseContract repository})
      : super(ExperienceInitial()) {
    _experienceRepository = repository;
  }

  static String box = HiveBoxes.experienceDataBox;

  Future<void> save(ExperienceModel experienceModel) async {
    var response = await _experienceRepository.saveData<ExperienceModel>(
      dataModel: experienceModel,
      boxName: box,
    );

    response.fold(
      (failure) {
        return emit(ExperienceSavingError());
      },
      (data) async {
        emit(ExperienceSaved());

        fetchData();
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _experienceRepository.deleteData<ExperienceModel>(
        index: index, boxName: box);

    response.fold(
      (l) => emit(ExperienceDeletingError()),
      (r) async {
        emit(ExperienceDeleted());
        fetchData();
      },
    );
  }

  Future<void> fetchData() async {
    var response =
        await _experienceRepository.fetchData<ExperienceModel>(boxName: box);

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
