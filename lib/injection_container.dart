import 'package:get_it/get_it.dart';
import 'package:resume_maker_app/feature/experience/presentatiton/cubit/cubit/experience_cubit.dart';

import 'core/navigation/navigation_service.dart';
import 'feature/language/presentation/cubit/language_cubit/language_cubit.dart';
import 'feature/references/presentation/cubit/references/references_cubit.dart';
import 'feature/skills/presentation/cubit/skill_cubit.dart';

final getIt = GetIt.instance;
void initDependencies() {
  getIt.registerLazySingleton(() => NavigationService.instance);
  getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  getIt.registerLazySingleton<SkillCubit>(() => SkillCubit());
  getIt.registerLazySingleton<ReferencesCubit>(() => ReferencesCubit());
  getIt.registerLazySingleton<ExperienceCubit>(() => ExperienceCubit());
}
