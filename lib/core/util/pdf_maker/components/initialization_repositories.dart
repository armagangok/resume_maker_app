// import 'package:resume_maker_app/data/models/user_data_model/user_data.dart';

// import '../../hive/hive_keys.dart';
// import '../../logger.dart';

// void initializeRepositories({required UserData? experienceList}) {
//   var repo = UserDataRepository.instance;
//   repo.fetchData(boxName: HiveBoxes.personalDataBox).then(
//         (value) => value.fold(
//           (failure) => LogHelper.shared.debugPrint("$failure"),
//           (data) {
//             personalDataModel = data;
//           },
//         ),
//       );

//   repo.fetchData(boxName: HiveBoxes.experienceDataBox).then(
//         (value) => value.fold(
//           (failure) async =>
//               (failure) => LogHelper.shared.debugPrint("$failure"),
//           (data) => experienceList = data,
//         ),
//       );

//   repo.fetchData(boxName: HiveBoxes.educationDataBox).then(
//         (value) => value.fold(
//           (failure) => LogHelper.shared.debugPrint("$failure"),
//           (r) => academicDataList = r,
//         ),
//       );

//   repo.fetchData(boxName: HiveBoxes.referenceDataBox).then(
//         (value) => value.fold(
//           (failure) => LogHelper.shared.debugPrint("$failure"),
//           (r) => referenceDataList = r,
//         ),
//       );

//   repo.fetchData(boxName: HiveBoxes.languageDataBox).then(
//         (value) => value.fold(
//           (failure) => LogHelper.shared.debugPrint("$failure"),
//           (data) => languageList = data,
//         ),
//       );

//   repo.fetchData(boxName: HiveBoxes.skillDataBox).then(
//         (value) => value.fold(
//           (failure) => LogHelper.shared.debugPrint("$failure"),
//           (r) => skillsList = r,
//         ),
//       );
// }
