import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_maker_app/feature/references/presentation/cubit/references/references_state.dart';

class ReferencesCubit extends Cubit<ReferencesState> {
	ReferencesCubit() : super(ReferencesState(isLoading: true));
	
	Future<void> loadInitialData() async {
		final stableState = state;
		try {
		  emit(state.copyWith(isLoading: true));
	
		  // TODO your code here
	
		  emit(state.copyWith(isLoading: false));
		} catch (error) {
		  emit(state.copyWith(error: error.toString()));
		  emit(stableState.copyWith(isLoading: false));
		}
	}
}
