import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../data/repository/academic_data_repository_imp.dart';
import '../../../model/academic_data_model.dart';

part 'academic_state.dart';

class AcademicCubit extends Cubit<AcademicState> {
  late final AcademicDataRepositoryImp academicRepository;

  AcademicCubit() : super(AcademicInitial()) {
    academicRepository = getIt<AcademicDataRepositoryImp>.call();
  }

  Future<void> saveAcademicData(AcademicDataModel academicDataModel) async {
    try {
      await academicRepository.saveAcademicData(academicDataModel);
      await getAcademicData();
    } catch (e) {
      emit(CacheError());
    }
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
          data!.isEmpty
              ? emit(AcademicInitial())
              : emit(DataReceived(dataList: data));
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
          data!.isEmpty
              ? emit(AcademicInitial())
              : emit(DataDeleted(dataList: data));
        },
      );
    } catch (e) {
      emit(CacheError());
    }
  }
}
