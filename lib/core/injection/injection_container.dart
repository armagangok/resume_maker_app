import 'package:get_it/get_it.dart';
import 'package:resume_maker_app/core/util/pdf_maker/repository/repo.dart';

import '../navigation/navigation_service.dart';
import '../util/pdf_maker/cloud_template.dart';
import '../util/pdf_maker/grey_plain_template.dart';
import '../util/pdf_maker/peach_puff_template.dart';
import '../../data/repository/local_database_repository_imp.dart';





final getIt = GetIt.instance;

void initDependencies() {
  // getIt.registerLazySingleton<PickImageCubit>(
  //   () => PickImageCubit(
  //     pickerRepository: ImagePickerRepositoryImp.instance,
  //   ),
  // );

  // getIt.registerLazySingleton<EducationTextControllerCubit>(
  //   () => EducationTextControllerCubit(),
  // );

  // getIt.registerLazySingleton<ImagePickerRepository>(
  //   () => ImagePickerRepositoryImp.instance,
  // );

  // getIt.registerLazySingleton<ExperienceTextControllerCubit>(
  //   () => ExperienceTextControllerCubit(),
  // );

  getIt.registerLazySingleton(
    () => NavigationService.instance,
  );

  // getIt.registerLazySingleton<TemplatesCubit>(
  //   () => TemplatesCubit(),
  // );

  // getIt.registerLazySingleton<PersonalDataCubit>(
  //   () => PersonalDataCubit(
  //     repository: LocalDatabaseRepositoryImp.instance,
  //     imagePickerCubit: getIt.call<PickImageCubit>(),
  //   ),
  // );

  // getIt.registerLazySingleton<EducationCubit>(
  //   () => EducationCubit(
  //     repository: LocalDatabaseRepositoryImp.instance,
  //   ),
  // );

  // getIt.registerLazySingleton<SkillCubit>(
  //   () => SkillCubit(
  //     repository: LocalDatabaseRepositoryImp.instance,
  //   ),
  // );

  // getIt.registerLazySingleton<LanguageCubit>(
  //   () => LanguageCubit(
  //     repository: LocalDatabaseRepositoryImp.instance,
  //   ),
  // );

  // getIt.registerLazySingleton<ProjectCubit>(
  //   () => ProjectCubit(
  //     repository: LocalDatabaseRepositoryImp.instance,
  //   ),
  // );

  // getIt.registerLazySingleton<ReferenceCubit>(
  //   () => ReferenceCubit(
  //     repository: LocalDatabaseRepositoryImp.instance,
  //   ),
  // );

  // getIt.registerLazySingleton<CloudTemplate>(
  //   () => CloudTemplate(
  //     pdfRepo: PdfRepo.instance,
  //   ),
  // );

  // getIt.registerLazySingleton<ExperienceCubit>(
  //   () => ExperienceCubit(
  //     repository: LocalDatabaseRepositoryImp.instance,
  //   ),
  // );

  // getIt.registerLazySingleton<GreyPlainTemplate>(
  //   () => GreyPlainTemplate(
  //     myRepository: PdfRepo.instance,
  //   ),
  // );

  // getIt.registerLazySingleton<PeachPuffTemplate>(
  //   () => PeachPuffTemplate(
  //     repo: PdfRepo.instance,
  //   ),
  // );
}
