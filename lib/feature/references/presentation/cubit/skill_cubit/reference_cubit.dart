import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../injection_container.dart';

import '../../../data/model/reference_model.dart';
import '../../../data/repository/reference_repository_imp.dart';

part 'reference_state.dart';

class ReferenceCubit extends Cubit<ReferenceState> {
  ReferenceCubit() : super(ReferenceInitial()) {
    _repository = getIt<ReferenceRepositoryImp>.call();
  }
  late final ReferenceRepositoryImp _repository;

  Future<void> save(ReferenceModel referenceModel) async {
    var response = await _repository.saveReferenceData(referenceModel);

    response.fold(
      (failure) {
        return emit(ReferenceSavingError());
      },
      (data) async {
        var response = await _repository.fetchReferenceData();

        response.fold(
          (failure) {
            if (failure is HiveNullData) {
              emit(ReferenceInitial());
            } else if (failure is HiveFetchFailure) {
              emit(ReferenceFetcingError());
            } else {
              emit(state);
            }
          },
          (data) async {
            emit(ReferenceFetched(referenceData: data));
          },
        );
      },
    );
  }

  Future<void> delete(int index) async {
    var response = await _repository.deleteReferenceData(index);

    response.fold(
      (l) => emit(ReferenceDeletingError()),
      (r) async {
        emit(ReferenceDeleted());
        var response = await _repository.fetchReferenceData();

        response.fold(
          (failure) {
            if (failure is HiveNullData) {
              emit(ReferenceInitial());
            } else if (failure is HiveFetchFailure) {
              emit(ReferenceFetcingError());
            } else {
              emit(state);
            }
          },
          (data) async {
            emit(ReferenceFetched(referenceData: data));
          },
        );
      },
    );
  }

  Future<void> fetchReferenceData() async {
    var response = await _repository.fetchReferenceData();

    response.fold(
      (failure) {
        if (failure is HiveNullData) {
          emit(ReferenceInitial());
        } else if (failure is HiveFetchFailure) {
          emit(ReferenceFetcingError());
        } else {
          emit(state);
        }
      },
      (data) async {
        emit(ReferenceFetched(referenceData: data));
      },
    );
  }
}
