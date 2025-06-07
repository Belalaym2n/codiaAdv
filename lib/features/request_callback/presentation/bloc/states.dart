abstract class RequestCallbackState {}

class RequestCallBackInitial extends RequestCallbackState {}

class RequestCallbackLoading extends RequestCallbackState {}

class RequestCallbackSuccess extends RequestCallbackState {}

class RequestCallbackError extends RequestCallbackState {
  final String message;

  RequestCallbackError(this.message);
}
