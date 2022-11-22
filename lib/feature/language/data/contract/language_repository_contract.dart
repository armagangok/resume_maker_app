import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../model/language_model.dart';

abstract class LanguageRepository {
  Future<Either<Failure, List<LanguageModel>>> fetchLanguageData();
  Future<Either<Failure, bool>> saveLanguageData(
    LanguageModel experienceModel,
  );
  Future<Either<Failure, bool>> deleteLanguageData(int index);
}
