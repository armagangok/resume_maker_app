import 'package:get_it/get_it.dart';


import '../export/export.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<NavigationContract>(
    () => NavigationService.instance,
  );

  getIt.registerLazySingleton<DesignCubit>(
    () => DesignCubit(),
  );

  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(),
  );

  getIt.registerLazySingleton<MultipleItemCubit>(
    () => MultipleItemCubit(),
  );
}
