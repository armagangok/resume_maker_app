import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/util/hive/hive_helper.dart';
import '../../../../core/util/hive/hive_keys.dart';
import '../contract/reference_repository.dart';
import '../model/reference_model.dart';

class ReferenceRepositoryImp extends ReferenceRepository {
  static final instance = ReferenceRepositoryImp._();
  ReferenceRepositoryImp._() {
    _hiveHelper = HiveHelper.shared;
  }

  late final HiveHelper _hiveHelper;
  @override
  Future<Either<Failure, bool>> deleteReferenceData(int index) async {
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
  Future<Either<Failure, List<ReferenceModel>>> fetchReferenceData() async {
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
  Future<Either<Failure, bool>> saveReferenceData(
      ReferenceModel referenceModel) async {
    try {
      await _hiveHelper.addData<ReferenceModel>(
        HiveBoxes.referenceDataBox,
        referenceModel,
      );

      return const Right(true);
    } on Exception {
      return Left(HiveSavingFailure());
    }
  }
}
