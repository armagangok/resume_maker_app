// import 'package:dartz/dartz.dart';

// import '../../../../core/contracts/database_contract.dart';
// import '../../../../core/error/failure.dart';
// import '../../../../core/util/hive/hive_helper.dart';
// import '../../../../core/util/hive/hive_keys.dart';
// import '../model/language_model.dart';

// class LanguageRepositoryImp implements DatabaseContract {
//   LanguageRepositoryImp({required HiveHelper hiveHelper}) {
//     _hiveHelper = hiveHelper;
//   }

//   late final HiveHelper _hiveHelper;
//   @override
//   Future<Either<Failure, bool>> deleteData(int index) async {
//     try {
//       await _hiveHelper.deleteDataAt<LanguageModel>(
//         HiveBoxes.languageDataBox,
//         index,
//       );
//       return const Right(true);
//     } on Exception {
//       return Left(HiveDeletingFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, List<LanguageModel>>> fetchData() async {
//     try {
//       var response = await _hiveHelper.getAll<LanguageModel>(
//         HiveBoxes.languageDataBox,
//       );

//       return response.isEmpty ? Left(HiveNullData()) : Right(response);
//     } on Exception {
//       return Left(HiveFetchFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> saveData({required dataModel}) async {
//     try {
//       await _hiveHelper.addData<LanguageModel>(
//         HiveBoxes.languageDataBox,
//         dataModel,
//       );
//       return const Right(true);
//     } catch (e) {
//       return Left(HiveSavingFailure());
//     }
//   }

//   @override
//   Future<void> updateData({required newDataModel}) async {}
// }
