import 'package:get_it/get_it.dart';

import 'core/contracts/database_contract.dart';
import 'core/util/pdf_maker/cloud_template.dart';
import 'core/util/pdf_maker/peach_puff_template.dart';
import 'feature/cv_templates/presentation/cubit/cv_templates_cubit.dart';
import 'feature/education/education_export.dart';

import 'feature/experience/data/repository/experience_repository_imp.dart';
import 'feature/experience/presentatiton/cubit/cubit/experience_cubit.dart';
import 'feature/experience/presentatiton/cubit/text_controller/experience_text_controller_cubit.dart';
import 'feature/language/data/repository/language_repository_imp.dart';
import 'feature/language/presentation/cubit/language_cubit/language_cubit.dart';

import 'feature/personal_details/export/personal_export.dart';
import 'feature/projects/data/repository/project_repository_imp.dart';
import 'feature/projects/presentation/cubit/project_cubit.dart';
import 'feature/references/data/repository/reference_repository_imp.dart';
import 'feature/references/presentation/cubit/skill_cubit/reference_cubit.dart';
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

  getIt.registerLazySingleton<PickImageCubit>(
    () => PickImageCubit(
      pickerRepository: ImagePickerRepositoryImp.instance,
    ),
  );
  getIt.registerLazySingleton<SkillCubit>(
    () => SkillCubit(
      skillRepository: SkillRepositoryImp(),
    ),
  );
  getIt.registerLazySingleton<ReferenceCubit>(
    () => ReferenceCubit(
      repository: ReferenceRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<ExperienceCubit>(
    () => ExperienceCubit(
      experienceRepository: ExperienceRepoImp(hiveHelper: HiveHelper.shared),
    ),
  );
  getIt.registerLazySingleton<EducationCubit>(
    () => EducationCubit(
      academicDataRepository: EducationDataRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<DatabaseContract>(
    () => EducationDataRepositoryImp.instance,
  );
  getIt.registerLazySingleton<EducationTextControllerCubit>(
    () => EducationTextControllerCubit(),
  );

  getIt.registerLazySingleton<PersonalDataCubit>(
    () => PersonalDataCubit(
        personalDataRepository: PersonalDataRepositoryImp.instance,
        imagePickerCubit: getIt<PickImageCubit>.call()),
  );
  getIt.registerLazySingleton<ImagePickerRepository>(
    () => ImagePickerRepositoryImp.instance,
  );
  // getIt.registerLazySingleton<DatabaseContract>(
  //   () => PersonalDataRepositoryImp.instance,
  // );
  // getIt.registerLazySingleton<DatabaseContract>(
  //   () => ExperienceRepoImp(hiveHelper: HiveHelper.shared),
  // );
  getIt.registerLazySingleton<ExperienceTextControllerCubit>(
    () => ExperienceTextControllerCubit(),
  );

  // getIt.registerLazySingleton<DatabaseContract>(
  //   () => ReferenceRepositoryImp.instance,
  // );
  // getIt.registerLazySingleton<DatabaseContract>(
  //   () => SkillRepositoryImp(),
  // );

  getIt.registerLazySingleton(
    () => NavigationService.instance,
  );

  getIt.registerLazySingleton<TemplatesCubit>(
    () => TemplatesCubit(),
  );

  getIt.registerLazySingleton<PeachPuffTemplate>(
    () => PeachPuffTemplate(
      experienceRepository: ExperienceRepoImp(hiveHelper: HiveHelper.shared),
      personalDataRepository: PersonalDataRepositoryImp.instance,
      academicDataRepository: EducationDataRepositoryImp.instance,
      referenceRepository: ReferenceRepositoryImp.instance,
      languageRepository: LanguageRepositoryImp(hiveHelper: HiveHelper.shared),
      skillRepository: SkillRepositoryImp(),
    ),
  );

  getIt.registerLazySingleton<GreyPlainTemplate>(
    () => GreyPlainTemplate(
      experienceRepository: ExperienceRepoImp(hiveHelper: HiveHelper.shared),
      personalDataRepository: PersonalDataRepositoryImp.instance,
      academicDataRepository: EducationDataRepositoryImp.instance,
      referenceRepository: ReferenceRepositoryImp.instance,
      languageRepository: LanguageRepositoryImp(hiveHelper: HiveHelper.shared),
      skillRepository: SkillRepositoryImp(),
    ),
  );

  getIt.registerLazySingleton<CloudTemplate>(
    () => CloudTemplate(
        experienceRepository: ExperienceRepoImp(hiveHelper: HiveHelper.shared),
        personalDataRepository: PersonalDataRepositoryImp.instance,
        academicDataRepository: EducationDataRepositoryImp.instance,
        referenceRepository: ReferenceRepositoryImp.instance,
        languageRepository:
            LanguageRepositoryImp(hiveHelper: HiveHelper.shared),
        skillRepository: SkillRepositoryImp(),
        projectRepository: ProjectRepoImp(hiveHelper: HiveHelper.shared)),
  );

  getIt.registerLazySingleton<ProjectCubit>(
    () => ProjectCubit(
      projectRepository: ProjectRepoImp(
        hiveHelper: HiveHelper.shared,
      ),
    ),
  );
}
