import 'package:get_it/get_it.dart';

import '../export/export.dart';

final getIt = GetIt.instance;

void initDependencies() {
  setupViewmodels();
  getIt.registerLazySingleton<NavigationContract>(
    () => NavigationService.instance,
  );
}

void registerUsecases() {}
void registerRepositories() {}
void registerDataSources() {
  
}

//  SETUP VIEWMODELS
void setupViewmodels() {
  getIt.registerLazySingleton<ColorPickerCubit>(
    () => ColorPickerCubit(),
  );

  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(),
  );

  getIt.registerLazySingleton<MultipleItemCubit>(
    () => MultipleItemCubit(),
  );
  getIt.registerLazySingleton<PersonalDataCubit>(
    () => PersonalDataCubit(),
  );

  getIt.registerLazySingleton<ImageCubit>(
    () => ImageCubit(),
  );
  getIt.registerLazySingleton<RootCubit>(
    () => RootCubit(),
  );

  getIt.registerLazySingleton<PreviewCubit>(
    () => PreviewCubit(),
  );

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(),
  );
}
