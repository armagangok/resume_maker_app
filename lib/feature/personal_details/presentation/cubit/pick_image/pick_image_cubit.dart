import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/constant/asset_constant.dart';
import '../../../../../core/util/image_picker_helper/error/image_uploading_error.dart';
import '../../../data/contract/image_picker_repository.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit({required ImagePickerRepository pickerRepository})
      : super(PickImageInitial(imagePath: "")) {
    _imageRepository = pickerRepository;
  }

  late final ImagePickerRepository _imageRepository;

  XFile _choosenImageFile = XFile("");

  XFile get getImageFile => _choosenImageFile;

  Future pickImage() async {
    emit(ImageLoading());
    var result = await _imageRepository.pickImage();

    result.fold(
      (failure) {
        if (failure is NullImageFailure) {
          emit(PickImageInitial(imagePath: personImage));
        } else {
          emit(ImageLoadingError());
        }
      },
      (data) async {
        _choosenImageFile = data!;
        emit(ImageLoaded(imagePath: _choosenImageFile.path));
      },
    );
  }
}
