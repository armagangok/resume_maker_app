import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/image_picker_helper/error/image_uploading_error.dart';
import '../../../../../injection_container.dart';
import '../../../data/repository/image_picker_repository_imp.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial()) {
    _imageRepository = getIt<ImagePickerRepositoryImp>.call();
  }

  late final ImagePickerRepositoryImp _imageRepository;

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
        emit(ImageLoaded(imagePath: r!.path));
      },
    );
  }
}
