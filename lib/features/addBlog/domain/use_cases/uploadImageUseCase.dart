import 'dart:io';

import 'package:codia_adv/features/addBlog/domain/repositories/blogDomainRepo.dart';

import '../../../../config/error_handling/errorHandling.dart';

class UploadImageUseCase {
  final BlogDomainRepo repository;

  UploadImageUseCase(this.repository);

  Future<Result> call(File image) async {
    return repository.uploadImage(image);
  }
}
