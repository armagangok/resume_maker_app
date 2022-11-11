import 'package:flutter_bloc/flutter_bloc.dart';

part 'academic_state.dart';

class AcademicCubit extends Cubit<AcademicState> {
  AcademicCubit() : super(AcademicInitial());
}
