import 'package:resume_maker_app/core/navigation/contract/base_navigation_service.dart';
import 'package:resume_maker_app/features/design/presentation/cubit/design_cubit.dart';

import 'injection_container.dart';

class Injection {
  Injection._();

  static NavigationContract get navigator => getIt.call<NavigationContract>();
  static DesignCubit get designCubit => getIt.call<DesignCubit>();
}
