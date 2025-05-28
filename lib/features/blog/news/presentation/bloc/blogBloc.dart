import 'package:codia_adv/features/blog/news/domain/use_cases/blogUseCase.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogEvents.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogBloc extends Bloc<BlogEvents, BlogStates> {
  BlogUseCase blogUseCase;

  BlogBloc({required this.blogUseCase}) : super(BlogInitial()) {
    on<BlogTabTabbedEvents>((events, state) async {
      emit(BlogLoading());

      final result = await blogUseCase();

      if (result.isSuccess) {
        final uiModels = result.data;
        emit(BlogSuccess(blogs: uiModels!));
      } else {
        emit(BlogFailure(message: result.error.toString()));
      }
    });
  }
}
