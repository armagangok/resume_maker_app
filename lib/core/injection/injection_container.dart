import 'package:get_it/get_it.dart';

import '../../features/home/presentation/viewmodels/file_entity/file_entity_cubit.dart';
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
  getit.registerLazySingleton<FileEntityCubit>(
    () => FileEntityCubit(homeUsecase: getit.get()),
  );

  getit.registerLazySingleton<HomeCubit>(
    () => HomeCubit(homeUsecase: getit.get()),
  );

  getit.registerLazySingleton<ResumeTemplateCubit>(
    () => ResumeTemplateCubit(resumeTemplateSource: getit()),
  );
}
