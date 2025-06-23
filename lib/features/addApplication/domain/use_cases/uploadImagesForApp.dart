import 'dart:io';

import '../../../../config/error_handling/errorHandling.dart';
import '../../../addBlog/domain/repositories/blogDomainRepo.dart';
import '../repositories/addAppRepo.dart';

class UploadAppImagesUseCase {
  final AddAppRepo repository;

  UploadAppImagesUseCase(this.repository);

  Future<Result<List<String>>> call(List<File> images) async {
    try {
      List<String> urls = [];

      for (final image in images) {
        final result = await repository.uploadImage(image);
        if (result.isSuccess) {
          urls.add(result.data); // Assuming result.data is String
        } else {
          return Result.failure(result.error);
        }
      }

      return Result.success(urls);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
