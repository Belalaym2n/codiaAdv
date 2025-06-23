import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:codia_adv/features/addApplication/domain/repositories/addAppRepo.dart';

import '../../../../config/error_handling/errorHandling.dart';

class AddAppUseCase {
  AddAppRepo addAppRepo;

  AddAppUseCase(this.addAppRepo);

  Future<Result<dynamic>> call(ApplicationEntity app) async {
    return await addAppRepo.addApp(app);
  }
}
