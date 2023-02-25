import 'package:get_it/get_it.dart';
import 'package:resume_maker_app/features/home/domain/contract/home_repository_contract.dart';

import '../export/export.dart';

final getit = GetIt.instance;

void initDependencies() {
  setupViewmodels();
  setupDataSources();
  setupUsecases();
  setupRepositories();
}

void setupUsecases() {}

void setupRepositories() {
  getit.registerLazySingleton<HomeRepositoryContract>(
    () => HomeRepository(
      homeDataSourceContract: getit.get(),
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
    () => HomeCubit(),
  );

  getit.registerLazySingleton<ResumeTemplateCubit>(
    () => ResumeTemplateCubit(designDataSource: getit()),
  );
}
