import 'package:get_it/get_it.dart';

import 'core/navigation/navigation_service.dart';
import 'core/util/image_picker_helper/image_picker_helper.dart';
import 'feature/academic/data/repository/academic_data_repository_imp.dart';
import 'feature/academic/presentation/cubit/academic_cubit/academic_cubit.dart';
import 'feature/experience/presentatiton/cubit/cubit/experience_cubit.dart';
import 'feature/language/presentation/cubit/language_cubit/language_cubit.dart';
import 'feature/personal_details/presentation/cubit/pick_image/pick_image_cubit.dart';
import 'feature/references/presentation/cubit/references/references_cubit.dart';
import 'feature/skills/presentation/cubit/skill_cubit.dart';

final getIt = GetIt.instance;
void initDependencies() {
  getIt.registerLazySingleton(() => NavigationService.instance);
  getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  getIt.registerLazySingleton<SkillCubit>(() => SkillCubit());
  getIt.registerLazySingleton<ReferencesCubit>(() => ReferencesCubit());
  getIt.registerLazySingleton<ExperienceCubit>(() => ExperienceCubit());
  getIt.registerLazySingleton<AcademicCubit>(() => AcademicCubit());
  getIt.registerLazySingleton<ImagePickerHelper>(() => ImagePickerHelper());
  getIt.registerLazySingleton<PickImageCubit>(() => PickImageCubit());
  getIt.registerLazySingleton<AcademicDataRepositoryImp>(() => AcademicDataRepositoryImp());
}
