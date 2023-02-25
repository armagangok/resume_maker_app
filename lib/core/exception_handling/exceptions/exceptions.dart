import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
class MyException with _$MyException {
  const factory MyException.noCachedException() = NoCachedException;

  const factory MyException.unknownLocalException() = UnknownLocalException;

  const factory MyException.deletingMyException() = DeletingMyException;

  const factory MyException.unknownRemoteException() = UnknownRemoteException;

  const factory MyException.noInternetException() = NoInternetException;

  const factory MyException.forbiddenMyException() = ForbiddenMyException;
}
