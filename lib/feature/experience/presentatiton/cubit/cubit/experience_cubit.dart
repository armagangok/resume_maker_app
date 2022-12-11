import '../../../../../core/contracts/database_contract.dart';
import '../../../../../core/util/pdf_maker/export/pdf_export.dart';

part 'experience_state.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  late final DatabaseContract _experienceRepository;

  ExperienceCubit({required DatabaseContract experienceRepository})
      : super(ExperienceInitial()) {
    _experienceRepository = experienceRepository;
  }

  static String box = HiveBoxes.experienceDataBox;

  Future<void> save(ExperienceModel experienceModel) async {
    var response = await _experienceRepository.saveData(
      dataModel: experienceModel,
      boxName: box,
    );

    response.fold(
      (failure) {
        return emit(ExperienceSavingError());
      },
      (data) async {
        var response = await _experienceRepository.fetchData(boxName: box);

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
    var response =
        await _experienceRepository.deleteData(index: index, boxName: box);

    response.fold(
      (l) => emit(ExperienceDeletingError()),
      (r) async {
        var response = await _experienceRepository.fetchData(boxName: box);

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

  Future<void> fetchData() async {
    var response = await _experienceRepository.fetchData(boxName: box);

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
