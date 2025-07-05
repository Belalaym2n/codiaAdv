import 'package:codia_adv/features/blog/news/domain/use_cases/blogUseCase.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogEvents.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'blogEvents.dart';
import 'blogStates.dart';
import '../../domain/use_cases/blogUseCase.dart';

class BlogBloc extends Bloc<BlogEvents, BlogStates> {
  bool isLoadedBefore = false;

  final BlogUseCase blogUseCase;

  static BlogBloc? _instance;
  static BlogBloc getInstance({required BlogUseCase blogUseCase}) {
    _instance ??= BlogBloc._internal(blogUseCase: blogUseCase);
    return _instance!;
  }
  BlogBloc._internal({required this.blogUseCase}) : super(BlogInitial()) {
    on<BlogTabTabbedEvents>((events, emit) async {
      if (isLoadedBefore) return; // ✅ لو اتحملت قبل كده، ما تعملش حاجة

      emit(BlogLoading());
      await Future.delayed(const Duration(seconds: 2));
      final result = await blogUseCase();

      if (result.isSuccess) {
        isLoadedBefore = true; // ✅ أول مرة بس
        emit(BlogSuccess(blogs: result.data!));
      } else {
        emit(BlogFailure(message: result.error.toString()));
      }
    });
  }


}
