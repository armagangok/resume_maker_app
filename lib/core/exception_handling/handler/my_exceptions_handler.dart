import '../../error/custom_failure.dart';
import '../exceptions/my_exceptions.dart';

class ExceptionHandler {
  CustomFailure handleException(MyException exception) {
    return exception.when(noCachedException: () {
      return CustomFailure(
          message:
              "Oh! You have no internet connection and It's your first time.");
    }, unknownLocalException: () {
      return CustomFailure(
          message: "Oh! Something went wrong with your device :(");
    }, deletingMyException: () {
      return CustomFailure(message: "Oh! We couldn't delete this favorite.");
    }, unknownRemoteException: () {
      return CustomFailure(
          message: "Oh! Something went wrong with the internet:(");
    }, noInternetException: () {
      return CustomFailure(
          message: "It seems like you have some connection problems.");
    }, forbiddenMyException: () {
      return CustomFailure(
          message: "Oh! What you are trying to do is forbidden.");
    });
  }
}
