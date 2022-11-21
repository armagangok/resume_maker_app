import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/util/image_picker_helper/error/image_uploading_error.dart';
import '../../../../../injection_container.dart';
import '../../../data/repository/image_picker_repository_imp.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial()) {
    _imageRepository = getIt<ImagePickerRepositoryImp>.call();
    _image = XFile("../../../../../../assets/person.png");
  }

  late final ImagePickerRepositoryImp _imageRepository;

  late XFile _image;

  XFile get image => _image;

  Future pickImage() async {
    emit(ImageLoading());
    var result = await _imageRepository.pickImage();

    result.fold(
      (l) {
        if (l is NullImageFailure) {
          emit(PickImageInitial());
        } else {
          emit(LoadError());
        }
      },
      (r) {
        _image = r!;

        emit(ImageLoaded());
      },
    );

    // if (result is Exception) {
    //   emit(LoadError());
    // } else if (_imagePicker.getImage == null) {
    //   emit(PickImageInitial());
    // } else {
    //   _image = _imagePicker.getImage;
    //   emit(ImageLoaded());
    // }

    // Future<void> discardImage() async {
    //   _image = null;
    //   emit(DiscardImage());
    // }
  }
}
