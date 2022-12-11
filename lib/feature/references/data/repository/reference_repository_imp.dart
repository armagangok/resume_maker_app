import 'package:dartz/dartz.dart';

import '../../../../core/contracts/database_contract.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/util/hive/hive_helper.dart';
import '../../../../core/util/hive/hive_keys.dart';
import '../model/reference_model.dart';

class ReferenceRepositoryImp extends DatabaseContract {
  static final instance = ReferenceRepositoryImp._();
  ReferenceRepositoryImp._() {
    _hiveHelper = HiveHelper.shared;
  }

  late final HiveHelper _hiveHelper;
  @override
  Future<Either<Failure, bool>> deleteData(int index) async {
    try {
      await _hiveHelper.deleteDataAt<ReferenceModel>(
        HiveBoxes.referenceDataBox,
        index,
      );
      return const Right(true);
    } on Exception {
      return Left(HiveDeletingFailure());
    }
  }

  @override
  Future<Either<Failure, List<ReferenceModel>>> fetchData() async {
    try {
      var response = await _hiveHelper.getAll<ReferenceModel>(
        HiveBoxes.referenceDataBox,
      );

      return response.isEmpty ? Left(HiveNullData()) : Right(response);
    } on Exception {
      return Left(HiveFetchFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveData({required dynamic dataModel}) async {
    try {
      await _hiveHelper.addData<ReferenceModel>(
        HiveBoxes.referenceDataBox,
        dataModel,
      );

      return const Right(true);
    } on Exception {
      return Left(HiveSavingFailure());
    }
  }

  @override
  Future<void> updateData({required newDataModel}) async {}
}
