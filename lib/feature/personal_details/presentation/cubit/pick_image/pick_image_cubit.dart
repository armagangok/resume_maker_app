import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/util/image_picker_helper/image_picker_helper.dart';
import '../../../../../injection_container.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial());

  XFile? _image;

  XFile? get image => _image;

  final _imagePicker = getIt<ImagePickerHelper>.call();

  Future<void> pickImage() async {
    emit(ImageLoading());
    var result = await _imagePicker.pickImage();

    if (result is Exception) {
      emit(LoadError());
    } else if (_imagePicker.getImage == null) {
      emit(PickImageInitial());
    } else {
      _image = _imagePicker.getImage;
      emit(ImageLoaded());
    }

    Future<void> discardImage() async {
      _image = null;
      emit(DiscardImage());
    }
  }
}
