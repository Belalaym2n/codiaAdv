import 'dart:io';

import 'package:codia_adv/features/addApplication/presentation/bloc/states.dart';
import 'package:codia_adv/features/addBlog/domain/use_cases/uploadImageUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/applicationEntity.dart';
import '../../domain/use_cases/addAppUseCase.dart';
import '../../domain/use_cases/uploadImagesForApp.dart';
import 'events.dart';

class AddAppBloc extends Bloc<AddAppEvents, AddAppState> {
  AddAppUseCase addAppUseCase;
  UploadAppImagesUseCase uploadImageUseCase;
  List<File?> selectedImages = List.filled(4, null);

  AddAppBloc({required this.addAppUseCase,
  required this.uploadImageUseCase
  }) : super(AddAppInitial()) {
    on<PickImageAtIndex>((event, emit) async {
      selectedImages[event.index] = event.imageFile;
      emit(ImagePickedSuccess(images: List.from(selectedImages)));
    });


    on<SubmitAppEvent>((event, emit) async {
      print(" lenght ${selectedImages.length}");

      if (selectedImages.any((image) => image == null)) {
        emit(AddAppFailure(error: "Please select all 4 images"));
        return;
      }

      emit(AddAppLoading());

      final uploadResult = await uploadImageUseCase(event.images);

      if (uploadResult.isFailure) {
        emit(AddAppFailure(error: uploadResult.error.toString()));
        return;
      }

      final urls = uploadResult.data;
      final appEntity = ApplicationEntity(
        headline: event.headline,
        description: event.description,
        image1: urls![0],
        image2: urls[1],
        image3: urls[2],
        image4: urls[3],
      );
      final result = await addAppUseCase(appEntity);

      result.isSuccess
          ? emit(AddAppSuccess())
          : emit(AddAppFailure(error: result.error.toString()));
    });

  }
}
