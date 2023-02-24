import 'package:get_it/get_it.dart';

import '../export/export.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<NavigationContract>(
    () => NavigationService.instance,
  );
}

void registerUsecases() {}
void registerRepositories() {}
void registerDataSources() {}

//  SETUP VIEWMODELS
void setupViewmodels() {
  getIt.registerLazySingleton<DesignCubit>(
    () => getIt(),
  );

  getIt.registerLazySingleton<ProfileCubit>(
    () => getIt(),
  );

  getIt.registerLazySingleton<MultipleItemCubit>(
    () => getIt(),
  );
  getIt.registerLazySingleton<PersonalDataCubit>(
    () => getIt(),
  );

  getIt.registerLazySingleton<ImageCubit>(
    () => getIt(),
  );
  getIt.registerLazySingleton<RootCubit>(
    () => getIt(),
  );

  getIt.registerLazySingleton<PreviewCubit>(
    () => getIt(),
  );

  getIt.registerLazySingleton<HomeCubit>(
    () => getIt(),
  );
}
