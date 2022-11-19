import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../data/repository/academic_data_repository_imp.dart';
import '../../../model/academic_data_model.dart';

part 'academic_state.dart';

class AcademicCubit extends Cubit<AcademicState> {
  AcademicCubit() : super(AcademicInitial()) {
    academicRepository = getIt<AcademicDataRepositoryImp>.call();
    academicDataList = [];
  }
  late final AcademicDataRepositoryImp academicRepository;
  late List<AcademicDataModel> academicDataList;

  void addAcademicData(AcademicDataModel academicDataModel) {
    academicDataList.add(academicDataModel);
    emit(AddAcademicData());
  }

  void removeAcademicData(int index) {
    academicDataList.removeAt(index);
    academicDataList.isEmpty
        ? emit(AcademicInitial())
        : emit(RemoveAcademicData());
  }

  Future<void> saveAcademicData(AcademicDataModel academicDataModel) async {
    await academicRepository.saveAcademicData(academicDataModel);
  }

  Future<Either<String, AcademicDataModel>> getAcademicData() async {
    var academicData = await academicRepository.getAcademicData();

    return academicData.fold(
      (left) {
        emit(ErrorOnCaching());
        return const Left("An unknown error occured while caching data.");
      },
      (rigth) {
        emit(CachedSuccesfully());
        return Right(rigth);
      },
    );
  }
}
