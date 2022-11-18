part of 'pick_image_cubit.dart';

abstract class PickImageState {}

class PickImageInitial extends PickImageState {}

class ImageLoading extends PickImageState {}

class ImageLoaded extends PickImageState {}

class LoadImage extends PickImageState {}

class LoadError extends PickImageState {}

class DiscardImage extends PickImageState {}