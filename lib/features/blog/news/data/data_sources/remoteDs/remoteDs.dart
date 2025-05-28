import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/blog/news/domain/entities/blogEntity.dart';

abstract class RemoteDs{
 Future<Result<List<BlogEntity>>> fetchBlogs();
}