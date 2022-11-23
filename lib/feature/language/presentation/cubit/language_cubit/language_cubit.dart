import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../injection_container.dart';
import '../../../data/model/language_model.dart';
import '../../../data/repository/language_repository_imp.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial()) {
    _repository = getIt<LanguageRepositoryImp>.call();
  }
  late final LanguageRepositoryImp _repository;

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
