import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectInitial());
}
