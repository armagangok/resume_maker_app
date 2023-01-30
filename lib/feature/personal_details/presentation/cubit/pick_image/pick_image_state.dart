part of 'pick_image_cubit.dart';

abstract class PickImageState {}

class PickImageInitial extends PickImageState {
  late final String imagePath;
  PickImageInitial({required this.imagePath});
}

class ImageLoading extends PickImageState {}

class ImageLoaded extends PickImageState {
  late final String imagePath;
  ImageLoaded({required this.imagePath});

  static const message = "Image is uploaded successfully!";
}

class ImageLoadingError extends PickImageState {
  static const message = "An error occured while uploading the image!";
}

class DiscardImage extends PickImageState {}
