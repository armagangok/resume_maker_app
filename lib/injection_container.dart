import 'core/export/core_export.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<PickImageCubit>(
    () => PickImageCubit(
      pickerRepository: ImagePickerRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<EducationTextControllerCubit>(
    () => EducationTextControllerCubit(),
  );

  getIt.registerLazySingleton<ImagePickerRepository>(
    () => ImagePickerRepositoryImp.instance,
  );

  getIt.registerLazySingleton<ExperienceTextControllerCubit>(
    () => ExperienceTextControllerCubit(),
  );

  getIt.registerLazySingleton(
    () => NavigationService.instance,
  );

  getIt.registerLazySingleton<TemplatesCubit>(
    () => TemplatesCubit(),
  );

  getIt.registerLazySingleton<PersonalDataCubit>(
    () => PersonalDataCubit(
      repository: LocalDatabaseRepositoryImp.instance,
      imagePickerCubit: PickImageCubit(
        pickerRepository: ImagePickerRepositoryImp.instance,
      ),
    ),
  );

  getIt.registerLazySingleton<EducationCubit>(
    () => EducationCubit(
      repository: LocalDatabaseRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<SkillCubit>(
    () => SkillCubit(
      repository: LocalDatabaseRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<LanguageCubit>(
    () => LanguageCubit(
      repository: LocalDatabaseRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<ProjectCubit>(
    () => ProjectCubit(
      repository: LocalDatabaseRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<ReferenceCubit>(
    () => ReferenceCubit(
      repository: LocalDatabaseRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<CloudTemplate>(
    () => CloudTemplate(
      repo: LocalDatabaseRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<ExperienceCubit>(
    () => ExperienceCubit(
      repository: LocalDatabaseRepositoryImp.instance,
    ),
  );
}
