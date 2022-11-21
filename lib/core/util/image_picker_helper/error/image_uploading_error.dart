import 'package:resume_maker_app/core/error/failure.dart';

abstract class ImagePickingFailure extends Failure {}

class NullImageFailure extends ImagePickingFailure {}

class PickingFailure extends ImagePickingFailure {
  static const errorMessage = "Error occured while picking image.";
}
