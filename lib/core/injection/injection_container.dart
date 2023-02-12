import 'package:get_it/get_it.dart';

import '../../features/profile/presentation/cubit/new_item/new_item_cubit.dart';
import '../export/export.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<NavigationContract>(
    () => NavigationService.instance,
  );

  getIt.registerLazySingleton<DesignCubit>(
    () => DesignCubit(),
  );

  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(),
  );

  getIt.registerLazySingleton<NewItemCubit>(
    () => NewItemCubit(),
  );
}
