import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../model/reference_model.dart';

abstract class ReferenceRepository {
  Future<Either<Failure, List<ReferenceModel>>> fetchReferenceData();
  Future<Either<Failure, bool>> saveReferenceData(
    ReferenceModel referenceModel,
  );
  Future<Either<Failure, bool>> deleteReferenceData(int index);
}
