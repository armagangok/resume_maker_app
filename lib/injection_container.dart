import 'package:get_it/get_it.dart';
import 'package:resume_maker_app/core/util/pdf_maker/repository/repo.dart';

import 'core/navigation/navigation_service.dart';
import 'core/util/pdf_maker/cloud_template.dart';
import 'core/util/pdf_maker/grey_plain_template.dart';
import 'core/util/pdf_maker/peach_puff_template.dart';
import 'data/repository/local_database_repository_imp.dart';
import 'feature/cv_templates/presentation/cubit/cv_templates_cubit.dart';
import 'feature/education/presentation/cubit/education_data/education_cubit.dart';
import 'feature/education/presentation/cubit/text_controller/text_controller_cubit.dart';
import 'feature/experience/presentatiton/cubit/cubit/experience_cubit.dart';
import 'feature/experience/presentatiton/cubit/text_controller/experience_text_controller_cubit.dart';
import 'feature/language/presentation/cubit/language_cubit/language_cubit.dart';
import 'feature/personal_details/data/contract/image_picker_repository.dart';
import 'feature/personal_details/data/repository/image_picker_repository_imp.dart';
import 'feature/personal_details/presentation/cubit/personal_data/personal_data_cubit.dart';
import 'feature/personal_details/presentation/cubit/pick_image/pick_image_cubit.dart';
import 'feature/projects/presentation/cubit/project_cubit.dart';
import 'feature/references/presentation/cubit/skill_cubit/reference_cubit.dart';
import 'feature/skills/presentation/cubit/skill_cubit/skill_cubit.dart';

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
      imagePickerCubit: getIt.call<PickImageCubit>(),
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
      pdfRepo: PdfRepo.instance,
    ),
  );

  getIt.registerLazySingleton<ExperienceCubit>(
    () => ExperienceCubit(
      repository: LocalDatabaseRepositoryImp.instance,
    ),
  );

  getIt.registerLazySingleton<GreyPlainTemplate>(
    () => GreyPlainTemplate(
      myRepository: PdfRepo.instance,
    ),
  );

  getIt.registerLazySingleton<PeachPuffTemplate>(
    () => PeachPuffTemplate(
      repo: PdfRepo.instance,
    ),
  );
}
