import 'package:codia_adv/features/blog/news/presentation/widgets/web/newsItemWeb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../blog/news/presentation/bloc/blogBloc.dart';
import '../../blog/news/presentation/bloc/blogStates.dart';
import '../widgets/blog/blog_news.dart';

class BlogWebSectionHomeScreen extends StatefulWidget {
  const BlogWebSectionHomeScreen({
    super.key,
    required this.width,
    required this.height,
  });

  final double height;
  final double width;

  @override
  State<BlogWebSectionHomeScreen> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogWebSectionHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogStates>(
      builder: (context, state) {
        if (state is BlogLoading) {
          return loadingWidget();
        } else if (state is BlogSuccess) {
          return state.blogs.isNotEmpty
              ? BlogsWebSectionItem(
                height: widget.height,
                width: widget.width,
                blogItems: state.blogs,
              )
              : Center(child: Text("No blogs available"));
        } else if (state is BlogFailure) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }

  Widget loadingWidget() {
    return Skeletonizer(
      enabled: true,
      child: NewsItemWeb(blogs: [], height: widget.height, width: widget.width),
    );
  }
}
