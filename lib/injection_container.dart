import 'package:get_it/get_it.dart';

import 'core/export/core_export.dart';
import 'feature/academic/data/contract/academic_data_repository.dart';
import 'feature/academic/data/repository/academic_data_repository_imp.dart';
import 'feature/academic/presentation/cubit/academic_data/academic_cubit.dart';
import 'feature/academic/presentation/cubit/text_controller/text_controller_cubit.dart';
import 'feature/experience/data/contract/experience_repository.dart';
import 'feature/experience/data/repository/experience_repository_imp.dart';
import 'feature/experience/presentatiton/cubit/cubit/experience_cubit.dart';
import 'feature/experience/presentatiton/cubit/text_controller/experience_text_controller_cubit.dart';
import 'feature/language/data/repository/language_repository_imp.dart';
import 'feature/language/presentation/cubit/language_cubit/language_cubit.dart';
import 'feature/personal_details/data/contract/personal_data_repository.dart';
import 'feature/personal_details/export/personal_export.dart';
import 'feature/references/data/contract/reference_repository.dart';
import 'feature/references/data/repository/reference_repository_imp.dart';
import 'feature/references/presentation/cubit/skill_cubit/reference_cubit.dart';
import 'feature/skills/data/contract/language_repository.dart';
import 'feature/skills/data/repository/skills_repository_imp.dart';
import 'feature/skills/presentation/cubit/skill_cubit/skill_cubit.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<LanguageCubit>(
    () => LanguageCubit(
      languageRepository: LanguageRepositoryImp(
        hiveHelper: HiveHelper.shared,
      ),
    ),
  );
  getIt.registerLazySingleton<SkillCubit>(
    () => SkillCubit(
      skillRepository: SkillRepositoryImp(),
    ),
  );
  getIt.registerLazySingleton<ReferenceCubit>(
    () => ReferenceCubit(
      repository: ReferenceRepositoryImp(),
    ),
  );

  getIt.registerLazySingleton<ExperienceCubit>(
    () => ExperienceCubit(
      experienceRepository: ExperienceRepositoryImp(),
    ),
  );
  getIt.registerLazySingleton<AcademicCubit>(
    () => AcademicCubit(
      academicDataRepository: AcademicDataRepositoryImp(),
    ),
  );

  getIt.registerLazySingleton<AcademicDataRepository>(
    () => AcademicDataRepositoryImp(),
  );
  getIt.registerLazySingleton<AcademicTextControllerCubit>(
    () => AcademicTextControllerCubit(),
  );

  getIt.registerLazySingleton<PersonalDataCubit>(
    () => PersonalDataCubit(
      personalDataRepository: getIt<PersonalDataRepository>.call(),
    ),
  );
  getIt.registerLazySingleton<ImagePickerRepository>(
    () => ImagePickerRepositoryImp(),
  );
  getIt.registerLazySingleton<PersonalDataRepository>(
    () => PersonalDataRepositoryImp(),
  );
  getIt.registerLazySingleton<ExperienceRepository>(
    () => ExperienceRepositoryImp(),
  );
  getIt.registerLazySingleton<ExperienceTextControllerCubit>(
    () => ExperienceTextControllerCubit(),
  );

  getIt.registerLazySingleton<PickImageCubit>(
    () => PickImageCubit(
      pickerRepository: getIt<ImagePickerRepository>.call(),
    ),
  );

  getIt.registerLazySingleton<ReferenceRepository>(
    () => ReferenceRepositoryImp(),
  );
  getIt.registerLazySingleton<SkillRepository>(
    () => SkillRepositoryImp(),
  );

  getIt.registerLazySingleton(
    () => NavigationService.instance,
  );
}
