
import 'dart:io';

import 'package:codia_adv/features/addBlog/domain/entities/blogEntity.dart';

class BlogEvent {}

class SubmitBlogEvent extends BlogEvent {
  final BlogEntity blog;

  SubmitBlogEvent({required this.blog});
}

class PickImageEvent extends BlogEvent {
  File? selectedImageFile;


  PickImageEvent(this.selectedImageFile);
}

