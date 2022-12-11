import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/util/hive/hive_keys.dart';
import '../../../../../data/contracts/database_contract.dart';
import '../../../data/model/language_model.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit({
    required DatabaseContract repository,
  }) : super(LanguageInitial()) {
    _repository = repository;
  }

  late final DatabaseContract _repository;

  static String box = HiveBoxes.languageDataBox;

  Future<void> save(LanguageModel languageModel) async {
    var response = await _repository.saveData<LanguageModel>(
      dataModel: languageModel,
      boxName: box,
    );

    response.fold(
      (failure) => emit(LanguageSavingError()),
      (data) async {
        emit(LanguageSaved());
        return fetchData();
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _repository.deleteData<LanguageModel>(
      index: index,
      boxName: box,
    );

    response.fold(
      (l) => emit(LanguageDeletingError()),
      (r) async {
        emit(LanguageDeleted());
        return fetchData();
      },
    );
  }

  Future<void> fetchData() async {
    var response = await _repository.fetchData<LanguageModel>(boxName: box);

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
