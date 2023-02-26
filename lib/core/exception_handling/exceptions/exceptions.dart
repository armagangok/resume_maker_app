import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
class CustomException with _$MyException {
  const factory CustomException.noCachedException() = NoCachedException;

  const factory CustomException.unknownLocalException() = UnknownLocalException;

  const factory CustomException.deletingMyException() = DeletingMyException;

  const factory CustomException.unknownRemoteException() =
      UnknownRemoteException;

  const factory CustomException.noInternetException() = NoInternetException;

  const factory CustomException.forbiddenMyException() = ForbiddenMyException;
}
