import 'package:codia_adv/features/blog/news/presentation/widgets/tablet/blogTabletItem.dart';
import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/tabletHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/sharedWidget/responiveSharedWidget/header/drawer.dart';
import '../../../../homePage/widgets/blog/blog_news.dart';
import '../../domain/entities/blogEntity.dart';
import '../bloc/blogBloc.dart';
import '../bloc/blogStates.dart';

class BlogTabletScreen extends StatelessWidget {
  BlogTabletScreen({super.key, required this.height, required this.width});

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            spreadRadius: 1,
            offset: Offset(0, 12),
          ),
        ],
        color: Colors.white, // لازم تحدد خلفية مع الظل
      ),
      child: Scaffold(
        drawer: Drawer(child: DrawerScreen(width: width, height: height)),
        body: Column(
          children: [
            TabletHeader(width: width, height: height),
            Expanded(
              child: BlocBuilder<BlogBloc, BlogStates>(
                builder: (context, state) {
                  if (state is BlogLoading) {
                    return loadingWidget();
                  } else if (state is BlogSuccess) {
                    return state.blogs.isNotEmpty
                        ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: BlogTablet(
                            height: height,
                            width: width,
                            blogItems: state.blogs,
                          ),
                        )
                        : Center(child: Text("No blogs available"));
                  } else if (state is BlogFailure) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
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
    return BlogsWebSectionItem(blogItems: blogs, height: height, width: width);
  }
}
