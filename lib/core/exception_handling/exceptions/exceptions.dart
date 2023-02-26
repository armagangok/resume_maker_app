import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
class CustomException with _$CustomException {
  const factory CustomException.noCachedException() = NoCachedException;

  const factory CustomException.unknownLocalException() = UnknownLocalException;

  const factory CustomException.deletingCustomException() = DeletingCustomException;

  const factory CustomException.unknownRemoteException() =
      UnknownRemoteException;

  const factory CustomException.noInternetException() = NoInternetException;

  const factory CustomException.forbiddenCustomException() = ForbiddenCustomException;
}
