import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/personal_data_repository_imp.dart';
import '../../../model/personal_data_model.dart';
import '../../../../../injection_container.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(PersonalDataInitial()) {
    _personalDataRepository = getIt<PersonalDataRepositoryImp>.call();
  }

  late final PersonalDataRepositoryImp _personalDataRepository;

  Future<void> deleteData(int index) async {
    await _personalDataRepository.deleteData(index);
  }

  Future<void> getPersonalData() async {
    var response = await _personalDataRepository.getPersonalData();

    response.fold(
      (l) {
        emit(PersonalDataCacheError());
      },
      (r) {
        r == null
            ? emit(PersonalDataInitial())
            : emit(DataReceived(personalData: r));
      },
    );
  }

  Future<void> savePersonalData(PersonalDataModel personalDataModel) async {
    var response =
        await _personalDataRepository.savePersonalData(personalDataModel);

    await getPersonalData();

    response.fold(
      (l) => emit(PersonalDataCacheError()),
      (r) => {},
    );
  }
}
