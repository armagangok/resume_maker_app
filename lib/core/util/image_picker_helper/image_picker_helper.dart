import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'error/image_uploading_error.dart';

class ImageLoaded {}

class ImagePickerHelper {
  XFile? _image;

  XFile? get getImage => _image;

  Future<Either<Exception, ImageLoaded>> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      _image = await picker.pickImage(source: ImageSource.gallery);
      return Right(ImageLoaded());
    } on PlatformException {
      return Left(ImageUploadingError());
    }
  }
}
