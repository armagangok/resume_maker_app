// import 'package:dartz/dartz.dart';

// import '../../../../core/contracts/database_contract.dart';
// import '../../education_export.dart';

// class EducationDataRepositoryImp implements DatabaseContract {
//   EducationDataRepositoryImp._();
//   static final instance = EducationDataRepositoryImp._();

//   @override
//   Future<Either<Failure, dynamic>> fetchData<T>() async {
//     try {
//       var response = await HiveHelper.shared.getAll<EducationDataModel>(
//         HiveBoxes.academicDataBox,
//       );

//       if (response.isEmpty) {
//         return Left(HiveNullData());
//       } else {
//         return Right(response);
//       }
//     } on Exception catch (e) {
//       LogHelper.shared.errorPrint("$e");
//       return Left(HiveFetchFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> deleteData(int index) async {
//     try {
//       await HiveHelper.shared.deleteDataAt<EducationDataModel>(
//         HiveBoxes.academicDataBox,
//         index,
//       );

//       return const Right(true);
//     } catch (e) {
//       return Left(HiveDeletingFailure());
//     }
//   }

//   @override
//   Future<void> updateData({required newDataModel}) async {}

//   @override
//   Future<Either<Failure, bool>> saveData({required dataModel}) async {
//     try {
//       await HiveHelper.shared.addData<EducationDataModel>(
//         HiveBoxes.academicDataBox,
//         dataModel,
//       );
//       return const Right(true);
//     } on Exception catch (e) {
//       LogHelper.shared.debugPrint("$e");
//       return Left(HiveSavingFailure());
//     }
//   }
// }
