import 'package:get_it/get_it.dart';
import 'package:resume_maker_app/features/preview/presentation/cubit/preview_cubit.dart';
import 'package:resume_maker_app/features/root_page/presentation/cubit/root_cubit.dart';

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

  getIt.registerLazySingleton<MultipleItemCubit>(
    () => MultipleItemCubit(),
  );
  getIt.registerLazySingleton<PersonalDataCubit>(
    () => PersonalDataCubit(),
  );

  getIt.registerLazySingleton<ImageCubit>(
    () => ImageCubit(),
  );
  getIt.registerLazySingleton<RootCubit>(
    () => RootCubit(),
  );

  getIt.registerLazySingleton<PreviewCubit>(
    () => PreviewCubit(),
  );
}
