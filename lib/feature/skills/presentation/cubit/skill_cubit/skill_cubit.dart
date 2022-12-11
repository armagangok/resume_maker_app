import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/util/hive/hive_keys.dart';
import '../../../../../data/contracts/database_contract.dart';
import '../../../data/model/skill_model.dart';

part 'skill_state.dart';

class SkillCubit extends Cubit<SkillState> {
  SkillCubit({required DatabaseContract repository}) : super(SkillInitial()) {
    _repository = repository;
  }
  late final DatabaseContract _repository;

  static const _box = HiveBoxes.skillDataBox;

  Future<void> save(SkillModel skillModel) async {
    var response = await _repository.saveData<SkillModel>(
        dataModel: skillModel, boxName: _box);

    response.fold(
      (failure) {
        return emit(SkillSavingError());
      },
      (data) async => fetchSkillData(),
    );
  }

  Future<void> delete(int index) async {
    var response = await _repository.deleteData<SkillModel>(
      index: index,
      boxName: _box,
    );

    response.fold(
      (l) => emit(SkillDeletingError()),
      (r) async {
        emit(SkillDeleted());
        fetchSkillData();
      },
    );
  }

  Future<void> fetchSkillData() async {
    var response = await _repository.fetchData<SkillModel>(boxName: _box);

    response.fold(
      (failure) {
        if (failure is HiveNullData) {
          emit(SkillInitial());
        } else if (failure is HiveFetchFailure) {
          emit(SkillFetcingError());
        } else {
          emit(state);
        }
      },
      (data) async {
        emit(SkillFetched(skillData: data));
      },
    );
  }
}
