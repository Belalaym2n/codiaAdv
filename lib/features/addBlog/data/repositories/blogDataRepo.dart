import 'dart:io';

import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addBlog/data/data_sources/remote/remoteDS.dart';
import 'package:codia_adv/features/addBlog/data/models/blogModel.dart';
import 'package:codia_adv/features/addBlog/domain/entities/blogEntity.dart';
import 'package:codia_adv/features/addBlog/domain/repositories/blogDomainRepo.dart';

class BlogDataRemoImp implements BlogDomainRepo {
  RemoteDS remoteDS;

  BlogDataRemoImp(this.remoteDS);

  @override
  Future<Result> submitBlog(BlogEntity blog) async {
    final model = BlogModel.fromEntity(blog);
    final result = await remoteDS.submitBlog(model);
    return result;
  }

  @override
  Future<Result> uploadImage(File image) async {
   return await remoteDS.uploadImage(image);
  }
}
