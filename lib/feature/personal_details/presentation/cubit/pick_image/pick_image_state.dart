part of 'pick_image_cubit.dart';

abstract class PickImageState {}

class PickImageInitial extends PickImageState {}

class ImageLoading extends PickImageState {}

class ImageLoaded extends PickImageCubit {}

class LoadImage extends PickImageState {}
