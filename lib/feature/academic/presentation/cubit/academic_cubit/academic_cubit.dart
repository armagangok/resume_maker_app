import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_maker_app/feature/academic/model/academic_data_model.dart';

part 'academic_state.dart';

class AcademicCubit extends Cubit<AcademicState> {
  AcademicCubit() : super(AcademicInitial());

  List<AcademicDataModel> academicDataList = [];

  void addAcademicData(AcademicDataModel academicDataModel) {
    academicDataList.add(academicDataModel);
    emit(AddAcademicData());
  }

  void removeAcademicData(int index) {
    academicDataList.removeAt(index);
    academicDataList.isEmpty ? emit(AcademicInitial()) : emit(RemoveAcademicData());
  }
}
