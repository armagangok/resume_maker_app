import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failure.dart';

abstract class ImagePickerRepository {
  Future<Either<Failure, XFile?>> pickImage();
}
