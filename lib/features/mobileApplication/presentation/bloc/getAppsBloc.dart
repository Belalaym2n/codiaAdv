import 'package:codia_adv/features/mobileApplication/domain/use_cases/getAppsUserCase.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/events.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/getAppsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAppsBloc extends Bloc<GetAppsEvents, GetAppsStates> {
  GetAppsUseCase useCase;

  GetAppsBloc({required this.useCase}) : super(GetAppsInitialState()) {
    on<TapTappedGetAppsEvents>((events, emit) async {
      emit(GetAppsLoading());

      final result = await useCase();
      if (result.isSuccess) {
        emit(GetAppsSuccess(result.data!)); // هنشوف تحسينها تحت
      } else {
        emit(GetAppsFailure(result.error ?? 'حدث خطأ'));
      }
    });
  }
}
