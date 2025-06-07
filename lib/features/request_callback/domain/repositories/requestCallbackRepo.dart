import 'package:codia_adv/config/error_handling/errorHandling.dart';

import '../entities/callbackModel.dart';

abstract class RequestCallbackRepo {
  Future<Result> submitRequest(CallbackEntity callbackEntity);
}
