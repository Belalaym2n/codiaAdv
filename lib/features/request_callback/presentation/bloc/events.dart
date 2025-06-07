import 'package:codia_adv/features/request_callback/domain/entities/callbackModel.dart';

abstract class RequestCallbackEvent {}

class SubmitCallbackRequest extends RequestCallbackEvent {
  CallbackEntity callbackEntity;

  SubmitCallbackRequest({required this.callbackEntity});
}
