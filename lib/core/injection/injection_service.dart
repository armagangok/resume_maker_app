import 'package:resume_maker_app/core/export/export.dart';

class Injection {
  Injection._();

  static NavigationContract get navigator => getIt.call<NavigationContract>();
  static DesignCubit get designCubit => getIt.call<DesignCubit>();
  static ProfileCubit get profileCubit => getIt.call<ProfileCubit>();
}
