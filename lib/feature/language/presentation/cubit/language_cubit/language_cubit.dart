import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/contract/language_repository.dart';
import '../../../data/model/language_model.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit({
    required LanguageRepository languageRepository,
  }) : super(LanguageInitial()) {
    _repository = languageRepository;
  }

  late final LanguageRepository _repository;

  Future<void> save(LanguageModel languageModel) async {
    var response = await _repository.saveLanguageData(languageModel);

    response.fold(
      (failure) {
        return emit(LanguageSavingError());
      },
      (data) async {
        var response = await _repository.fetchLanguageData();

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
    var response = await _repository.deleteLanguageData(index);

    response.fold(
      (l) => emit(LanguageDeletingError()),
      (r) async {
        var response = await _repository.fetchLanguageData();

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
    var response = await _repository.fetchLanguageData();

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
