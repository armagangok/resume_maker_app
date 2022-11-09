import 'package:get_it/get_it.dart';

import 'core/navigation/navigation_service.dart';
import 'feature/language/presentation/bloc/language_cubit/language_cubit.dart';
import 'feature/skills/presentation/cubit/skill_cubit.dart';

final getIt = GetIt.instance;
void initDependencies() {
  getIt.registerLazySingleton(() => NavigationService.instance);
  getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  getIt.registerLazySingleton<SkillCubit>(() => SkillCubit());
}
