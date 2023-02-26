import 'package:freezed_annotation/freezed_annotation.dart';

part 'path_provider_exceptions.freezed.dart';

@freezed
class CustomException with _$CustomException {
  @Implements<Exception>()
  const factory CustomException.noCachedException() = NoCachedException;
  @Implements<Exception>()
  const factory CustomException.unknownLocalException() =
      UnknownLocalException;
  @Implements<Exception>()
  const factory CustomException.deletingCustomException() =
      DeletingCustomException;
  @Implements<Exception>()
  const factory CustomException.unknownRemoteException() =
      UnknownRemoteException;
  @Implements<Exception>()
  const factory CustomException.noInternetException() =
      NoInternetException;
  @Implements<Exception>()
  const factory CustomException.forbiddenCustomException() =
      ForbiddenCustomException;
}
