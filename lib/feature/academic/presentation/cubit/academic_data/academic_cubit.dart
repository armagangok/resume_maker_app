import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../data/repository/academic_data_repository_imp.dart';
import '../../../model/academic_data_model.dart';

part 'academic_state.dart';

class AcademicCubit extends Cubit<AcademicState> {
  late final AcademicDataRepositoryImp academicRepository;
  late List<AcademicDataModel> academicDataList;

  AcademicCubit() : super(AcademicInitial()) {
    academicRepository = getIt<AcademicDataRepositoryImp>.call();
    academicRepository.getAcademicData().then(
          (value) => academicDataList = value.fold(
            (l) => [],
            (r) => academicDataList = r!,
          ),
        );
  }

  Future<void> saveAcademicData(AcademicDataModel academicDataModel) async {
    await academicRepository.saveAcademicData(academicDataModel);
    emit(DataSaved());
  }

  // Gets academic data from hive database.
  Future getAcademicData() async {
    try {
      var response = await academicRepository.getAcademicData();
      response.fold(
        (error) {
          emit(CacheError());
        },
        (data) {
          emit(DataLoaded(academicDataModel: data!));
        },
      );
    } on Exception {
      emit(CacheError());
    }
  }

  // Deletes data from hive database
  Future<void> deleteData(int index) async {
    try {
      await academicRepository.deleteData(index);

      var response = await academicRepository.getAcademicData();
      response.fold(
        (error) {
          emit(CacheError());
        },
        (data) {
          emit(DataLoaded(academicDataModel: data!));
        },
      );
    } catch (e) {
      emit(CacheError());
    }
  }
}
