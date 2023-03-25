import 'package:get_it/get_it.dart';

import '../../domain/repositories/home_repository.dart';
import '../export/export.dart';

final getit = GetIt.instance;

void initDependencies() {
  setupViewmodels();
  setupDataSources();
  setupUsecases();
  setupRepositories();
  setupDataProviders();
}

void setupUsecases() {
  getit.registerLazySingleton<HomeUsecase>(
    () => HomeUsecase(
      homeRepository: getit.get(),
    ),
  );
  getit.registerLazySingleton<UserDataUsecase>(
    () => UserDataUsecase.instance,
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

  getit.registerLazySingleton<ExceptionHandler>(
    () => ExceptionHandler(),
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
    () => ResumeTemplateCubit(resumeTemplateSource: getit()),
  );

  getit.registerLazySingleton<ExportCubit>(
    () => ExportCubit(),
  );
}

void setupDataProviders() {}
