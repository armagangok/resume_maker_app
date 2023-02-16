import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  ImagePickerHelper._();
  static final instance = ImagePickerHelper._();

  XFile? _image;

  XFile? get getImage => _image;

  Future<XFile?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    _image = await picker.pickImage(source: ImageSource.gallery);
    return _image;
  }

  Future<XFile?> pickImageByCamera() async {
    final ImagePicker picker = ImagePicker();

    _image = await picker.pickImage(source: ImageSource.camera);
    return _image;
  }
}
