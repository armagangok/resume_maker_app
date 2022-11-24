import 'package:get_it/get_it.dart';
import 'feature/academic/data/contract/academic_data_repository.dart';
import 'feature/experience/data/contract/experience_repository.dart';
import 'feature/language/data/contract/language_repository.dart';
import 'feature/personal_details/data/contract/image_picker_repository.dart';
import 'feature/personal_details/data/contract/personal_data_repository.dart';
import 'feature/references/data/contract/reference_repository.dart';
import 'feature/references/presentation/cubit/text_controller/text_controller_cubit.dart';

import 'core/navigation/navigation_service.dart';
import 'feature/academic/data/repository/academic_data_repository_imp.dart';
import 'feature/academic/presentation/cubit/academic_data/academic_cubit.dart';
import 'feature/academic/presentation/cubit/text_controller/text_controller_cubit.dart';
import 'feature/experience/data/repository/experience_repository_imp.dart';
import 'feature/experience/presentatiton/cubit/cubit/experience_cubit.dart';
import 'feature/experience/presentatiton/cubit/text_controller/experience_text_controller_cubit.dart';
import 'feature/language/data/repository/language_repository_imp.dart';
import 'feature/language/presentation/cubit/language_cubit/language_cubit.dart';
import 'feature/personal_details/data/repository/image_picker_repository_imp.dart';
import 'feature/personal_details/data/repository/personal_data_repository_imp.dart';
import 'feature/personal_details/presentation/cubit/personal_data/personal_data_cubit.dart';
import 'feature/personal_details/presentation/cubit/personal_text_controllers/personal_text_controllers_cubit.dart';
import 'feature/personal_details/presentation/cubit/pick_image/pick_image_cubit.dart';
import 'feature/references/data/repository/reference_repository_imp.dart';
import 'feature/references/presentation/cubit/skill_cubit/reference_cubit.dart';
import 'feature/skills/data/contract/language_repository.dart';
import 'feature/skills/data/repository/skills_repository_imp.dart';
import 'feature/skills/presentation/cubit/skill_cubit/skill_cubit.dart';


final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton(() => NavigationService.instance);
  getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  getIt.registerLazySingleton<SkillCubit>(() => SkillCubit());
  getIt.registerLazySingleton<ReferenceCubit>(() => ReferenceCubit());
  getIt.registerLazySingleton<ReferenceTextControllerCubit>(() => ReferenceTextControllerCubit());
  getIt.registerLazySingleton<ExperienceCubit>(() => ExperienceCubit());
  getIt.registerLazySingleton<AcademicCubit>(() => AcademicCubit());
  getIt.registerLazySingleton<PickImageCubit>(() => PickImageCubit());
  getIt.registerLazySingleton<AcademicDataRepository>(() => AcademicDataRepositoryImp());
  getIt.registerLazySingleton<AcademicTextControllerCubit>(() => AcademicTextControllerCubit());
  getIt.registerLazySingleton<PersonalTextControllerCubit>(() => PersonalTextControllerCubit());
  getIt.registerLazySingleton<PersonalDataCubit>(() => PersonalDataCubit());
  getIt.registerLazySingleton<ImagePickerRepository>(() => ImagePickerRepositoryImp());
  getIt.registerLazySingleton<PersonalDataRepository>(() => PersonalDataRepositoryImp());
  getIt.registerLazySingleton<ExperienceRepository>(() => ExperienceRepositoryImp());
  getIt.registerLazySingleton<ExperienceTextControllerCubit>(() =>ExperienceTextControllerCubit());
  getIt.registerLazySingleton<LanguageRepository>(() =>LanguageRepositoryImp());
  getIt.registerLazySingleton<ReferenceRepository>(() =>ReferenceRepositoryImp());
  getIt.registerLazySingleton<SkillRepository>(() =>SkillRepositoryImp());
}
