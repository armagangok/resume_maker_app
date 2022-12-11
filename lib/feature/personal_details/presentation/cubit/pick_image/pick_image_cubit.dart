import '../../../../../core/export/core_export.dart';

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
          emit(LoadError());
        }
      },
      (data) async {
        _choosenImageFile = data!;
        emit(ImageLoaded(imagePath: _choosenImageFile.path));
      },
    );
  }
}
