import 'dart:io';

abstract class AddAppState {}

class AddAppInitial extends AddAppState {}

class ImagePickedSuccess extends AddAppState {
  final List<File?> images;

  ImagePickedSuccess({required this.images});
}
class AddAppLoading extends AddAppState {}

class AddAppSubmitting extends AddAppState {}

class AddAppSuccess extends AddAppState {}

class AddAppFailure extends AddAppState {
  final String error;

  AddAppFailure({required this.error});
}

