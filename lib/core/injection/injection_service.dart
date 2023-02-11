import 'package:resume_maker_app/core/export/export.dart';

import '../../features/profile/presentation/cubit/new_item/new_item_cubit.dart';

class Injection {
  Injection._();

  static NavigationContract get navigator => getIt.call<NavigationContract>();
  static DesignCubit get designCubit => getIt.call<DesignCubit>();
  static ProfileCubit get profileCubit => getIt.call<ProfileCubit>();
  static NewItemCubit get newItemCubit => getIt.call<NewItemCubit>();
}
