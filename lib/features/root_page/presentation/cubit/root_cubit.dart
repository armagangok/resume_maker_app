import 'package:bloc/bloc.dart';


part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootInitial());
}
