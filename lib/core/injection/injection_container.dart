import 'package:get_it/get_it.dart';

import '../export/export.dart';

final getit = GetIt.instance;

void initDependencies() {
  setupViewmodels();
  setupDataSources();
  setupUsecases();
  setupRepositories();
}

void setupUsecases() {
  getit.registerLazySingleton<HomeUsecase>(
    () => HomeUsecase(
      homeRepository: getit.get(),
    ),
  );
}

void setupRepositories() {
  getit.registerLazySingleton<HomeRepositoryContract>(
    () => HomeRepository(
      homeDataSourceContract: getit.get(),
      exceptionHandler: getit.get(),
    ),
  );
}

// SETUP DATA SOURCES
void setupDataSources() {
  getit.registerLazySingleton<DesignDataSourceContract>(
    () => DesignDataSource(),
  );
  getit.registerLazySingleton<HomeDataSourceContract>(
    () => HomeDataSource(),
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

  getit.registerLazySingleton<NavigationContract>(
    () => NavigationService.instance,
  );

  getit.registerLazySingleton<PreviewCubit>(
    () => PreviewCubit(),
  );

  getit.registerLazySingleton<HomeCubit>(
    () => HomeCubit(homeUsecase: getit.get()),
  );

  getit.registerLazySingleton<ResumeTemplateCubit>(
    () => ResumeTemplateCubit(designDataSource: getit()),
  );
}
