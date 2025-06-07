import 'package:codia_adv/features/request_callback/domain/use_cases/requestCallbackUseCase.dart';
import 'package:codia_adv/features/request_callback/presentation/bloc/events.dart';
import 'package:codia_adv/features/request_callback/presentation/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestCallBackBloc
    extends Bloc<RequestCallbackEvent, RequestCallbackState> {
  RequestCallbackUseCase useCase;

  RequestCallBackBloc(this.useCase) : super(RequestCallBackInitial()) {
    on<SubmitCallbackRequest>((event, emit) async {
      if (event.callbackEntity.name.trim().isEmpty ||
          event.callbackEntity.phone.trim().isEmpty ||
          event.callbackEntity.email.trim().isEmpty) {
        return emit(RequestCallbackError('All data must be not empty'));
      }
      emit(RequestCallbackLoading());
      await Future.delayed(Duration(seconds: 1));
      final result = await useCase(event.callbackEntity);
      if (result.isSuccess) {

        return    emit(RequestCallbackSuccess());
      } else {
        return  emit(RequestCallbackError(result.error.toString()));
      }
    });
  }



}
