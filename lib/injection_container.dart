import 'package:get_it/get_it.dart';

import 'core/navigation/navigation_service.dart';

final getIt = GetIt.instance;
void initDependencies() {
  getIt.registerLazySingleton(() => NavigationService.instance);
}
