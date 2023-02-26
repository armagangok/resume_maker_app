abstract class ImagePickingFailure {}

class NullImageFailure extends ImagePickingFailure {}

class PickingFailure extends ImagePickingFailure {
  PickingFailure({required this.errorMessage});
  final String errorMessage;
}
