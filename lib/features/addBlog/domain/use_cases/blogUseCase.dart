import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addBlog/domain/entities/blogEntity.dart';
import 'package:codia_adv/features/addBlog/domain/repositories/blogDomainRepo.dart';

  class BlogUseCase{
  final BlogDomainRepo repository;
  BlogUseCase(this.repository);

 Future<Result>call(BlogEntity blog)async{
    return   repository.submitBlog(blog);
  }
}