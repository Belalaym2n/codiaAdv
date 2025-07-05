 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../blog/news/domain/entities/blogEntity.dart';
import '../../blog/news/presentation/bloc/blogBloc.dart';
import '../../blog/news/presentation/bloc/blogStates.dart';
import '../widgets/blog/blog_news.dart';

class BlogSectionHomeScreen extends StatefulWidget {
    BlogSectionHomeScreen({
    super.key,
    required this.width,
    required this.height,
      this.isDesktop=true,
  });

  final double height;
  final double width;
  bool isDesktop;

  @override
  State<BlogSectionHomeScreen> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSectionHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogStates>(
      builder: (context, state) {
        if (state is BlogLoading) {
          return loadingWidget();
        } else if (state is BlogSuccess) {
          return state.blogs.isNotEmpty
              ? BlogsWebSectionItem(
            isDesktop:widget.isDesktop ,
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
  List<GetBlogEntity> blogs = [
    GetBlogEntity(
      instagramLink: "instagramLink",
      id: "id",
      imageUrl:
      "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",
      headline: "headline",
      description:
      "There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs.There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs. There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs.There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs. There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs.",
      blogDate: "blogDate",
      createdAt: "createdAt",
      facebookLink: "facebookLink",
      googlePlayLink: "googlePlayLink",
      amazonLink: "amazonLink",
      appStoreLink: "appStoreLink",
      linkedinLink: "linkedinLink",
    ),
  ];
  Widget loadingWidget() {
    return BlogsWebSectionItem(
      blogItems: blogs,
      height: widget.height,
      width: widget.width,
    );
  }
}
