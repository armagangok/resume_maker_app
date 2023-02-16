import 'package:resume_maker_app/core/export/export.dart';

import '../../features/profile/presentation/cubit/new_item/new_item_cubit.dart';

class Injection {
  Injection._();

  static final _phoneItemCubit = NewItemCubit();
  static final _emailItemCubit = NewItemCubit();
  static final _linkItemCubit = NewItemCubit();
  static final _skillsCubit = MultipleItemCubit();
  static final _educationCubit = MultipleItemCubit();
  static final _qualificationCubit = MultipleItemCubit();
  static final _languageCubit = MultipleItemCubit();
  static final _experienceCubit = MultipleItemCubit();

  static NavigationContract get navigator => getIt.call<NavigationContract>();
  static DesignCubit get designCubit => getIt.call<DesignCubit>();
  static ProfileCubit get profileCubit => getIt.call<ProfileCubit>();
  static NewItemCubit get phoneItemCubit => _phoneItemCubit;
  static NewItemCubit get emailItemCubit => _emailItemCubit;
  static NewItemCubit get linkItemCubit => _linkItemCubit;
  static MultipleItemCubit get skillsCubit => _skillsCubit;
  static MultipleItemCubit get languageCubit => _languageCubit;
  static MultipleItemCubit get educationCubit => _educationCubit;
  static MultipleItemCubit get qualificationsCubit => _qualificationCubit;
  static MultipleItemCubit get experienceCubit => _experienceCubit;
  static PersonalDataCubit get personalDataCubit =>
      getIt.call<PersonalDataCubit>();
}
