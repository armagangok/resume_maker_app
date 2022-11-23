import '../../../error/failure.dart';

abstract class ImagePickingFailure extends Failure {}

class NullImageFailure extends ImagePickingFailure {}

class PickingFailure extends ImagePickingFailure {
  PickingFailure({required this.errorMessage});
  final String errorMessage;
}
