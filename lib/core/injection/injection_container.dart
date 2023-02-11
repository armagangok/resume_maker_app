import 'package:get_it/get_it.dart';
import 'package:resume_maker_app/core/navigation/contract/base_navigation_service.dart';
import 'package:resume_maker_app/features/design/presentation/cubit/design_cubit.dart';

import '../navigation/navigation_service.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<NavigationContract>(
    () => NavigationService.instance,
  );

  getIt.registerLazySingleton<DesignCubit>(
    () => DesignCubit(),
  );
}
