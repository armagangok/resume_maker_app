// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'image_cubit.dart';

abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImagePickingFailure extends ImageState {}

class ImagePicked extends ImageState {
  XFile? file;

  ImagePicked({
    this.file,
  });
}

class ImagePicking extends ImageState {}
