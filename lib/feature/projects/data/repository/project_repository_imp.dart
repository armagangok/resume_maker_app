// import 'package:dartz/dartz.dart';

// import '../../../../core/export/core_export.dart';
// import '../contract/project_repository.dart';
// import '../model/project_model.dart';

// class ProjectRepoImp extends ProjectRepository {
//   ProjectRepoImp({required HiveHelper hiveHelper}) {
//     _hiveHelper = hiveHelper;
//   }

//   late final HiveHelper _hiveHelper;

//   @override
//   Future<Either<Failure, bool>> deleteData(int index) async {
//     try {
//       await _hiveHelper.deleteDataAt<ProjectModel>(
//         HiveBoxes.projectDataBox,
//         index,
//       );
//       return const Right(true);
//     } on Exception {
//       return Left(HiveDeletingFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, List<ProjectModel>>> fetchData() async {
//     try {
//       var response = await _hiveHelper.getAll<ProjectModel>(
//         HiveBoxes.projectDataBox,
//       );

//       return response.isEmpty ? Left(HiveNullData()) : Right(response);
//     } on Exception {
//       return Left(HiveFetchFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> saveData({
//     required dynamic dataModel,
//   }) async {
//     try {
//       await _hiveHelper.addData<ProjectModel>(
//         HiveBoxes.projectDataBox,
//         dataModel,
//       );

//       return const Right(true);
//     } on Exception {
//       return Left(HiveSavingFailure());
//     }
//   }

//   @override
//   Future<void> updateData({required newDataModel}) async {
//     LogHelper.shared.debugPrint("Project Model Updated...");
//   }
// }
