import '../../../education_export.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  late final LocalDatabaseRepositoryImp _academicRepository;

  EducationCubit({required LocalDatabaseRepositoryImp repository})
      : super(EducationInitial()) {
    _academicRepository = repository;
  }

  var educationBox = HiveBoxes.academicDataBox;

  Future<void> saveEducationData(EducationDataModel academicDataModel) async {
    try {
      await _academicRepository.saveData(
          dataModel: academicDataModel, boxName: educationBox);
      await getEducationData();
    } catch (e) {
      emit(EducationSavingError());
    }
  }

  // Gets academic data from hive database.
  Future getEducationData() async {
    var response = await _academicRepository.fetchData<EducationDataModel>(
      boxName: educationBox,
    );
    response.fold(
      (failure) {
        if (failure is HiveNullData) {
          emit(EducationInitial());
        } else if (failure is HiveFetchFailure) {
          emit(EducationFetchingError());
        } else {
          emit(state);
        }
      },
      (data) async {
        if (data == null) {
          emit(EducationInitial());
        } else if (data.isEmpty) {
          emit(EducationInitial());
        } else {
          emit(EducationDataReceived(academicDataList: data));
        }
      },
    );
  }

  // Deletes data from hive database
  Future<void> deleteData(int index) async {
    try {
      await _academicRepository.deleteData(
        index: index,
        boxName: educationBox,
      );

      emit(EducationDeleted());

      var response = await _academicRepository.fetchData(boxName: educationBox);
      response.fold(
        (error) {
          emit(EducationDeletingError());
        },
        (data) {
          data!.isEmpty
              ? emit(EducationInitial())
              : emit(EducationDataReceived(academicDataList: data));
        },
      );
    } catch (e) {
      emit(EducationFetchingError());
    }
  }
}
