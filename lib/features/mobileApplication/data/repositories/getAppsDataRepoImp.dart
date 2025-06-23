import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:codia_adv/features/addBlog/data/data_sources/remote/remoteDS.dart';
import 'package:codia_adv/features/mobileApplication/data/data_sources/remote/getAppsRemoteDS.dart';
import 'package:codia_adv/features/mobileApplication/domain/repositories/getAppsDomainRepo.dart';

class GetAppsDataRepoImp implements GetAppsDomainRepo {
  GetAppsRemoteDS remoteDS;

  GetAppsDataRepoImp(this.remoteDS);

  @override
  Future<Result<List<ApplicationEntity>>> fetchApps() async {
    final result = await remoteDS.getApps();

    final entities =
        result.data?.map((app) => ApplicationEntity.toEntity(app)).toList();
    return Result.success(entities);
  }
}
