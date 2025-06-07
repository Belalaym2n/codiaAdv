import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/request_callback/data/models/requestCallbackModel.dart';

abstract class RequestCallRemoteDS{

  Future<Result>submitRequest(RequestCallbackModel model);
}