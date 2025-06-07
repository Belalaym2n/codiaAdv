import 'dart:io';

class BlogState{}

class BlogInitial extends BlogState {}
class BlogLoading extends BlogState {}

class BlogSubmitting extends BlogState {}

class BlogSuccess extends BlogState {}

class BlogFailure extends BlogState {
  final String error;

  BlogFailure({required this.error});
}

class ImagePickedSuccess extends BlogState {
  final File imageFile;
  final String imageUrl;

  ImagePickedSuccess({required this.imageFile, required this.imageUrl});
}