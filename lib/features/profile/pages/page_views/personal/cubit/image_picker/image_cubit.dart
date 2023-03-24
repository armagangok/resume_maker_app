import 'package:image_picker/image_picker.dart';
import 'package:resume_maker_app/core/util/image_picker_helper/image_picker_helper.dart';

import '../../../../../../../../core/export/export.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  String imagePath = "";

  final _imagePicker = ImagePickerHelper.instance;

  Future<void> pickImgae(ImagePickingChoice choice) async {
    emit(ImagePicking());
    try {
      switch (choice) {
        case ImagePickingChoice.camera:
          var response = await _imagePicker.pickImageByCamera();

          emit(ImagePicked(file: response));
          imagePath = response!.path;
          break;
        case ImagePickingChoice.gallery:
          var response = await _imagePicker.pickImageFromGallery();

          imagePath = response!.path;
          
          emit(ImagePicked(file: response));
          break;
      }
    } catch (e) {
      emit(ImagePickingFailure());
    }
  }
}

enum ImagePickingChoice {
  camera,
  gallery,
}
