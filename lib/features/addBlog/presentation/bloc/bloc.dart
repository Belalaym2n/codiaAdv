import 'dart:io';

import 'package:codia_adv/features/addBlog/domain/use_cases/blogUseCase.dart';
import 'package:codia_adv/features/addBlog/presentation/bloc/states.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/use_cases/uploadImageUseCase.dart';
import 'events.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogUseCase submitBlogUseCase;
  final UploadImageUseCase uploadImageUseCase;
  File? selectedImageFile;

  BlogBloc({required this.submitBlogUseCase, required this.uploadImageUseCase})
    : super(BlogInitial()) {
    on<PickImageEvent>((event, emit) async {
      if (event.selectedImageFile != null) {
        selectedImageFile = event.selectedImageFile;
        emit(ImagePickedSuccess(
          imageUrl: '',
          imageFile: selectedImageFile!
        ));
      }
    });
    on<SubmitBlogEvent>((event, emit) async {
      String? url;
      if (selectedImageFile == null) {
        return emit(BlogFailure(error: 'Please choose an image'));
      }
      emit(BlogLoading());
      final uploadImageResul = await uploadImageUseCase(selectedImageFile!);

      if (uploadImageResul.isSuccess) {
        url = uploadImageResul.data.toString();
      } else {
        return emit(BlogFailure(error: uploadImageResul.error.toString()));
      }

      final blogWithImage = event.blog.copyWith(imageUrl: url);
      final result = await submitBlogUseCase(blogWithImage);
      if (result.isSuccess) {
        emit(BlogSuccess());
      } else {
        emit(BlogFailure(error: result.error.toString()));
      }
    });
  }
}
