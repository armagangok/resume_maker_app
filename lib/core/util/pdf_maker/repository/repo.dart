// import 'package:resume_maker_app/data/repository/local_database_repository_imp.dart';

// import '../../../../data/contracts/database_contract.dart';
// import '../../../../feature/education/data/model/education_model.dart';
// import '../../../../feature/experience/data/model/experience_model.dart';
// import '../../../../feature/language/data/model/language_model.dart';
// import '../../../../feature/personal_details/data/model/personal_data_model.dart';
// import '../../../../feature/projects/data/model/project_model.dart';
// import '../../../../feature/references/data/model/reference_model.dart';
// import '../../../../feature/skills/data/model/skill_model.dart';
// import '../../hive/hive_keys.dart';
// import '../../logger.dart';

// class PdfRepo {
//   PdfRepo._({required DatabaseContract database}) {
//     myrepo = database;
//     initializeRepositories();
//   }

//   static final instance = PdfRepo._(
//     database: LocalDatabaseRepositoryImp.instance,
//   );

//   late final DatabaseContract myrepo;
//   List<ExperienceModel>? experienceList;
//   PersonalDataModel? personalDataModel;
//   List<EducationDataModel>? educationDataModel;
//   List<ReferenceModel>? referenceDataList;
//   List<LanguageModel>? languageList;
//   List<SkillModel>? skillsList;
//   List<ProjectModel>? projectList;

//   void initializeRepositories() {
//     myrepo
//         .fetchData<PersonalDataModel>(
//           boxName: HiveBoxes.personalDataBox,
//         )
//         .then(
//           (value) => value.fold(
//             (failure) => LogHelper.shared.debugPrint("$failure"),
//             (data) => personalDataModel = data[0],
//           ),
//         );

//     myrepo
//         .fetchData<ExperienceModel>(boxName: HiveBoxes.experienceDataBox)
//         .then(
//           (value) => value.fold(
//             (failure) async =>
//                 (failure) => LogHelper.shared.debugPrint("$failure"),
//             (data) => experienceList = data,
//           ),
//         );

//     myrepo
//         .fetchData<EducationDataModel>(
//           boxName: HiveBoxes.educationDataBox,
//         )
//         .then(
//           (value) => value.fold(
//             (failure) => LogHelper.shared.debugPrint("$failure"),
//             (r) => educationDataModel = r,
//           ),
//         );

//     myrepo.fetchData<ReferenceModel>(boxName: HiveBoxes.referenceDataBox).then(
//           (value) => value.fold(
//             (failure) => LogHelper.shared.debugPrint("$failure"),
//             (r) => referenceDataList = r,
//           ),
//         );

//     myrepo.fetchData<LanguageModel>(boxName: HiveBoxes.languageDataBox).then(
//           (value) => value.fold(
//             (failure) => LogHelper.shared.debugPrint("$failure"),
//             (data) => languageList = data,
//           ),
//         );

//     myrepo.fetchData<SkillModel>(boxName: HiveBoxes.skillDataBox).then(
//           (value) => value.fold(
//             (failure) => LogHelper.shared.debugPrint("$failure"),
//             (r) => skillsList = r,
//           ),
//         );

//     myrepo.fetchData<ProjectModel>(boxName: HiveBoxes.projectDataBox).then(
//           (value) => value.fold(
//             (failure) => LogHelper.shared.debugPrint("$failure"),
//             (r) => projectList = r,
//           ),
//         );
//   }
// }
