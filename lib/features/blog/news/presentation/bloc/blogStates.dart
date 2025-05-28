import 'package:codia_adv/features/blog/news/domain/entities/blogEntity.dart';

abstract class BlogStates {}

class BlogInitial extends BlogStates {}

class BlogLoading extends BlogStates {}

class BlogSuccess extends BlogStates {
 List< BlogEntity> blogs;

  BlogSuccess({required this.blogs});
}

class BlogFailure extends BlogStates {
  String message;
  BlogFailure({
    required this.message
});
}
