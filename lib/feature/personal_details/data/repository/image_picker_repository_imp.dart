import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/util/image_picker_helper/error/image_uploading_error.dart';
import '../../../../core/util/image_picker_helper/image_picker_helper.dart';
import '../contract/image_picker_repository.dart';

class ImagePickerRepositoryImp extends ImagePickerRepository {
  ImagePickerRepositoryImp() {
    _imagePicker = ImagePickerHelper.instance;
  }
  late final ImagePickerHelper _imagePicker;

  @override
  Future<Either<Failure, XFile?>> pickImage() async {
    try {
      var response = await _imagePicker.pickImage();

      return response == null ? Left(NullImageFailure()) : Right(response);
    } on Exception {
      return Left(PickingFailure());
    }
  }
}
