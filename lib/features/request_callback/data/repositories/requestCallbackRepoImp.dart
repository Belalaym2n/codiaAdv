import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addBlog/data/data_sources/remote/remoteDS.dart';
import 'package:codia_adv/features/request_callback/data/models/requestCallbackModel.dart';
import 'package:codia_adv/features/request_callback/domain/entities/callbackModel.dart';
import 'package:codia_adv/features/request_callback/domain/repositories/requestCallbackRepo.dart';

import '../data_sources/remoteDS/remoteDSImp.dart';

class RequestCallbackRepoIMP implements RequestCallbackRepo {
  RequestCallbackRemoteDSI requestCallbackRemoteDSI;

  RequestCallbackRepoIMP(this.requestCallbackRemoteDSI);

  @override
  Future<Result> submitRequest(CallbackEntity callbackEntity) async {
    final result = await requestCallbackRemoteDSI.submitRequest(
      RequestCallbackModel.fromEntity(callbackEntity),
    );
    if (result.isSuccess) {
      return Result.success(result);
    } else {
      return Result.failure(result.error);
    }
  }
}
