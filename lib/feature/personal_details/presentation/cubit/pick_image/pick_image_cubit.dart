import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/image_picker_helper/error/image_uploading_error.dart';
import '../../../../../injection_container.dart';
import '../../../data/repository/image_picker_repository_imp.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial(imagePath: "")) {
    _imageRepository = getIt<ImagePickerRepositoryImp>.call();
  }

  late final ImagePickerRepositoryImp _imageRepository;

  String _choosenImagePath = "";

  String get getChoosenImagePath => _choosenImagePath;

  Future pickImage() async {
    emit(ImageLoading());
    var result = await _imageRepository.pickImage();

    result.fold(
      (failure) {
        if (failure is NullImageFailure) {
          emit(PickImageInitial(imagePath: ""));
        } else {
          emit(LoadError());
        }
      },
      (data) {
        _choosenImagePath = data!.path;
        emit(ImageLoaded(imagePath: _choosenImagePath));
      },
    );
  }
}
