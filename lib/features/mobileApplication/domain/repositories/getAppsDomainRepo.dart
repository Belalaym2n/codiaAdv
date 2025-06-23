import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';

abstract class GetAppsDomainRepo {

  Future<Result<List<ApplicationEntity>>>fetchApps();
}