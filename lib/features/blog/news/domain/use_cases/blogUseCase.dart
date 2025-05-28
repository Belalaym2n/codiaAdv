import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/blog/news/domain/entities/blogEntity.dart';

import '../repositories/blogDomainUseCase.dart';

  class BlogUseCase {

  BlogDomainRepo  repo;

  BlogUseCase(this.repo);
  Future<Result<List<BlogEntity>>>call() async {
  return await  repo.getBlogs();
  }
}