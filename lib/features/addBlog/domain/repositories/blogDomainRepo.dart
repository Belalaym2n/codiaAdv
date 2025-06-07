import 'dart:io';

import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addBlog/domain/entities/blogEntity.dart';

abstract class BlogDomainRepo {
  Future<Result> submitBlog(BlogEntity blog);

  Future<Result> uploadImage(File image);
}
