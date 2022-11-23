import 'package:get_it/get_it.dart';

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
import 'feature/references/presentation/cubit/references/references_cubit.dart';
import 'feature/skills/data/repository/skills_repository_imp.dart';
import 'feature/skills/presentation/cubit/skill_cubit/skill_cubit.dart';


final getIt = GetIt.instance;
void initDependencies() {
  getIt.registerLazySingleton(() => NavigationService.instance);
  getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  getIt.registerLazySingleton<SkillCubit>(() => SkillCubit());
  getIt.registerLazySingleton<ReferencesCubit>(() => ReferencesCubit());
  getIt.registerLazySingleton<ExperienceCubit>(() => ExperienceCubit());
  getIt.registerLazySingleton<AcademicCubit>(() => AcademicCubit());
  getIt.registerLazySingleton<PickImageCubit>(() => PickImageCubit());
  getIt.registerLazySingleton<AcademicDataRepositoryImp>(() => AcademicDataRepositoryImp());
  getIt.registerLazySingleton<AcademicTextControllerCubit>(() => AcademicTextControllerCubit());
  getIt.registerLazySingleton<PersonalTextControllerCubit>(() => PersonalTextControllerCubit());
  getIt.registerLazySingleton<PersonalDataCubit>(() => PersonalDataCubit());
  getIt.registerLazySingleton<ImagePickerRepositoryImp>(() => ImagePickerRepositoryImp());
  getIt.registerLazySingleton<PersonalDataRepositoryImp>(() => PersonalDataRepositoryImp());
  getIt.registerLazySingleton<ExperienceRepositoryImp>(() => ExperienceRepositoryImp());
  getIt.registerLazySingleton<ExperienceTextControllerCubit>(() =>ExperienceTextControllerCubit());
  getIt.registerLazySingleton<LanguageRepositoryImp>(() =>LanguageRepositoryImp());
  getIt.registerLazySingleton<ReferenceRepositoryImp>(() =>ReferenceRepositoryImp());
  getIt.registerLazySingleton<SkillRepositoryImp>(() =>SkillRepositoryImp());
}
