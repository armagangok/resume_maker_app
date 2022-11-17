import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/reference_model.dart';

part 'references_state.dart';

class ReferencesCubit extends Cubit<ReferencesState> {
  ReferencesCubit() : super(ReferenceInitial());

  List<ReferenceModel> referencesList = [];

  void addReference(ReferenceModel reference) {
    referencesList.add(reference);
    emit(AddReference());
  }

  void removeReference(int index) {
    referencesList.removeAt(index);
    emit(RemoveReference());
  }
}
