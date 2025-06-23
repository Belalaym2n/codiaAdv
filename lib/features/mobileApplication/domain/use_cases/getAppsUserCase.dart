import 'package:codia_adv/features/mobileApplication/domain/repositories/getAppsDomainRepo.dart';

import '../../../../config/error_handling/errorHandling.dart';
import '../../../addApplication/domain/entities/applicationEntity.dart';

class GetAppsUseCase{
  GetAppsDomainRepo getAppsDomainRepo;
  GetAppsUseCase(this.getAppsDomainRepo);

  Future<Result<List<ApplicationEntity>>> call() async {
     final result=await  getAppsDomainRepo.fetchApps();
     if(result.isSuccess){
       return Result.success(result.data);
     } else{
       return Result.failure(result.error);
     }
   }

}