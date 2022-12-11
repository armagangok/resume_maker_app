import 'package:resume_maker_app/core/contracts/database_contract.dart';

import '../../../../../core/export/core_export.dart';
import '../../../data/model/skill_model.dart';

part 'skill_state.dart';

class SkillCubit extends Cubit<SkillState> {
  SkillCubit({required DatabaseContract skillRepository})
      : super(SkillInitial()) {
    _repository = skillRepository;
  }
  late final DatabaseContract _repository;

  Future<void> save(SkillModel skillModel) async {
    var response = await _repository.saveData(dataModel: skillModel);

    response.fold(
      (failure) {
        return emit(SkillSavingError());
      },
      (data) async {
        var response = await _repository.fetchData();

        emit(SkillSaved());

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
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _repository.deleteData(index);

    response.fold(
      (l) => emit(SkillDeletingError()),
      (r) async {
        var response = await _repository.fetchData();

        emit(SkillDeleted());

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
      },
    );
  }

  Future<void> fetchSkillData() async {
    var response = await _repository.fetchData();

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
