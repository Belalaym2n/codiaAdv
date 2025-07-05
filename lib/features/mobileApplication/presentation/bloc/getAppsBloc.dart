import 'package:codia_adv/features/mobileApplication/domain/use_cases/getAppsUserCase.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/events.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/getAppsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAppsBloc extends Bloc<GetAppsEvents, GetAppsStates> {
  GetAppsUseCase useCase;
  static bool isLoadedBefore = false;
  static GetAppsBloc? _instance;

  static GetAppsBloc getInstance({required GetAppsUseCase useCase}) {
    _instance ??= GetAppsBloc._internal(useCase: useCase);
    return _instance!;
  }

  GetAppsBloc._internal({required this.useCase})
    : super(GetAppsInitialState()) {
    on<TapTappedGetAppsEvents>((events, emit) async {
      if (isLoadedBefore) return; // ✅ لو اتحملت قبل كده، ما تعملش حاجة

      emit(GetAppsLoading());

      final result = await useCase();
      if (result.isSuccess) {
        isLoadedBefore = true; // هنشوف تحسينها تحت

        emit(GetAppsSuccess(result.data!));
      } else {
        emit(GetAppsFailure(result.error ?? 'حدث خطأ'));
      }
    });
  }
}
