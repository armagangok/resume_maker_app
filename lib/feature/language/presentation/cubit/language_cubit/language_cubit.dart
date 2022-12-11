import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/contracts/database_contract.dart';
import '../../../../../core/error/failure.dart';
import '../../../data/model/language_model.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit({
    required DatabaseContract languageRepository,
  }) : super(LanguageInitial()) {
    _repository = languageRepository;
  }

  late final DatabaseContract _repository;

  Future<void> save(LanguageModel languageModel) async {
    var response = await _repository.saveData(dataModel: languageModel);

    response.fold(
      (failure) => emit(LanguageSavingError()),
      (data) async {
        var response = await _repository.fetchData();

        emit(LanguageSaved());

        response.fold(
          (failure) {
            if (failure is HiveNullData) {
              emit(LanguageInitial());
            } else if (failure is HiveFetchFailure) {
              emit(LanguageFetcingError());
            } else {
              emit(state);
            }
          },
          (data) async {
            emit(LanguageFetched(languageData: data));
          },
        );
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _repository.deleteData(index);

    response.fold(
      (l) => emit(LanguageDeletingError()),
      (r) async {
        var response = await _repository.fetchData();

        emit(LanguageDeleted());

        response.fold(
          (failure) {
            if (failure is HiveNullData) {
              emit(LanguageInitial());
            } else if (failure is HiveFetchFailure) {
              emit(LanguageFetcingError());
            } else {
              emit(state);
            }
          },
          (data) async {
            emit(LanguageFetched(languageData: data));
          },
        );
      },
    );
  }

  Future<void> fetchLanguageData() async {
    var response = await _repository.fetchData();

    response.fold(
      (failure) {
        if (failure is HiveNullData) {
          emit(LanguageInitial());
        } else if (failure is HiveFetchFailure) {
          emit(LanguageFetcingError());
        } else {
          emit(state);
        }
      },
      (data) async {
        emit(LanguageFetched(languageData: data));
      },
    );
  }
}
