import '../../../academic_export.dart';

part 'academic_state.dart';

class AcademicCubit extends Cubit<AcademicState> {
  late final AcademicDataRepositoryImp _academicRepository;

  AcademicCubit({required AcademicDataRepositoryImp academicDataRepository})
      : super(AcademicInitial()) {
    _academicRepository = academicDataRepository;
  }

  Future<void> saveAcademicData(AcademicDataModel academicDataModel) async {
    try {
      await _academicRepository.saveAcademicData(academicDataModel);
      await getAcademicData();
    } catch (e) {
      emit(AcademicSavingError());
    }
  }

  // Gets academic data from hive database.
  Future getAcademicData() async {
    var response = await _academicRepository.fetchAcademicData();
    response.fold(
      (failure) {
        if (failure is HiveNullData) {
          emit(AcademicInitial());
        } else if (failure is HiveFetchFailure) {
          emit(AcademicFetchingError());
        } else {
          emit(state);
        }
      },
      (data) async {
        if (data == null) {
          emit(AcademicInitial());
        } else if (data.isEmpty) {
          emit(AcademicInitial());
        } else {
          emit(AcademicDataReceived(academicDataList: data));
        }
      },
    );
  }

  // Deletes data from hive database
  Future<void> deleteData(int index) async {
    try {
      await _academicRepository.deleteData(index);

      emit(AcademicDeleted());

      var response = await _academicRepository.fetchAcademicData();
      response.fold(
        (error) {
          emit(AcademicDeletingError());
        },
        (data) {
          data!.isEmpty
              ? emit(AcademicInitial())
              : emit(AcademicDataReceived(academicDataList: data));
        },
      );
    } catch (e) {
      emit(AcademicFetchingError());
    }
  }
}
