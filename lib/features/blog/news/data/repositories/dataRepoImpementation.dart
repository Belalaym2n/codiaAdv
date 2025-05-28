import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/blog/news/data/data_sources/remoteDs/remoteDs.dart';
import 'package:codia_adv/features/blog/news/domain/entities/blogEntity.dart';
import 'package:codia_adv/features/blog/news/domain/repositories/blogDomainUseCase.dart';

class BlogRepoImpl implements BlogDomainRepo {
  RemoteDs remoteDs;

  BlogRepoImpl({required this.remoteDs});

  @override
  Future<Result<List<BlogEntity>>> getBlogs() async {
    return await remoteDs.fetchBlogs();
  }
}
