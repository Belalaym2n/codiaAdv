import 'package:codia_adv/config/error_handling/errorHandling.dart';

import '../entities/callbackModel.dart';
import '../repositories/requestCallbackRepo.dart';

class RequestCallbackUseCase {
  RequestCallbackRepo requestCallbackRepo;

  RequestCallbackUseCase(this.requestCallbackRepo);

  Future<Result> call(CallbackEntity callbackEntity) async {
    return await  requestCallbackRepo.submitRequest(callbackEntity);
  }
}
