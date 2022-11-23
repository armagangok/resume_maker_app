import '../../../../../core/export/core_export.dart';
import '../../../data/model/skill_model.dart';
import '../../../data/repository/skills_repository_imp.dart';

part 'skill_state.dart';

class SkillCubit extends Cubit<SkillState> {
  SkillCubit() : super(SkillInitial()) {
    _repository = getIt<SkillRepositoryImp>.call();
  }
  late final SkillRepositoryImp _repository;

  Future<void> save(SkillModel skillModel) async {
    var response = await _repository.saveSkillData(skillModel);

    response.fold(
      (failure) {
        return emit(SkillSavingError());
      },
      (data) async {
        var response = await _repository.fetchSkillData();

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
    var response = await _repository.deleteSkillData(index);

    response.fold(
      (l) => emit(SkillDeletingError()),
      (r) async {
        var response = await _repository.fetchSkillData();

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
    var response = await _repository.fetchSkillData();

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
