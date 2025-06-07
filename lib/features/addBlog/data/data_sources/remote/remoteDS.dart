import 'dart:io';

import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addBlog/data/models/blogModel.dart';

abstract class RemoteDS{
  Future<Result>submitBlog(BlogModel blog);
  Future<Result>uploadImage(File image);

}