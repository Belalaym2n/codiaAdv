import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addApplication/data/models/applicationModel.dart';

abstract class GetAppsRemoteDS {
  Future<Result<List<ApplicationModel>>> getApps();
}
