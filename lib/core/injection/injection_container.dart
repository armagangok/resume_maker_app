import 'package:get_it/get_it.dart';

import '../export/export.dart';

final getit = GetIt.instance;

void initDependencies() {
  setupViewmodels();
  getit.registerLazySingleton<NavigationContract>(
    () => NavigationService.instance,
  );
}

void setupUsecases() {}
void setupRepositories() {}
void setupDataSources() {
  getit.registerLazySingleton<DesignDataSourceContract>(
    () => DesignDataSource(),
  );
}

//  SETUP VIEWMODELS
void setupViewmodels() {
  getit.registerLazySingleton<ColorPickerCubit>(
    () => ColorPickerCubit(),
  );

  getit.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(),
  );

  getit.registerLazySingleton<MultipleItemCubit>(
    () => MultipleItemCubit(),
  );
  getit.registerLazySingleton<PersonalDataCubit>(
    () => PersonalDataCubit(),
  );

  getit.registerLazySingleton<ImageCubit>(
    () => ImageCubit(),
  );
  getit.registerLazySingleton<RootCubit>(
    () => RootCubit(),
  );

  getit.registerLazySingleton<PreviewCubit>(
    () => PreviewCubit(),
  );

  getit.registerLazySingleton<HomeCubit>(
    () => HomeCubit(),
  );

  getit.registerLazySingleton<ResumeTemplateCubit>(
    () => ResumeTemplateCubit(),
  );
}
