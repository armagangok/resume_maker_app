import 'package:freezed_annotation/freezed_annotation.dart';

part 'path_provider_exceptions.freezed.dart';

@freezed
class PathProviderException with _$PathProviderException {
  @Implements<Exception>()
  const factory PathProviderException.noCachedException() = NoCachedException;
  @Implements<Exception>()
  const factory PathProviderException.unknownLocalException() =
      UnknownLocalException;
  @Implements<Exception>()
  const factory PathProviderException.deletingPathProviderException() =
      DeletingPathProviderException;
  @Implements<Exception>()
  const factory PathProviderException.unknownRemoteException() =
      UnknownRemoteException;
  @Implements<Exception>()
  const factory PathProviderException.noInternetException() =
      NoInternetException;
  @Implements<Exception>()
  const factory PathProviderException.forbiddenPathProviderException() =
      ForbiddenPathProviderException;
}
