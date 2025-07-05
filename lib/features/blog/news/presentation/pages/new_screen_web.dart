import 'package:codia_adv/features/blog/news/data/data_sources/remoteDs/remoteDSIMP.dart';
import 'package:codia_adv/features/blog/news/data/data_sources/remoteDs/remoteDs.dart';
import 'package:codia_adv/features/blog/news/domain/entities/blogEntity.dart';
import 'package:codia_adv/features/blog/news/domain/repositories/blogDomainUseCase.dart';
import 'package:codia_adv/features/blog/news/domain/use_cases/blogUseCase.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogBloc.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogEvents.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogStates.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import '../../data/repositories/dataRepoImpementation.dart';
import '../widgets/desktop/newsItemWeb.dart';

class NewsScreenWeb extends StatefulWidget {
  NewsScreenWeb({super.key, required this.height, required this.width});

  double height;
  double width;

  @override
  State<NewsScreenWeb> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreenWeb> {
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
        body: Column(
          children: [
            WebHeader(
              width: widget.width,
              height: widget.height,
            ), // هنا الـ Header ثابت فوق

            Expanded(
              child: BlocBuilder<BlogBloc, BlogStates>(
                builder: (context, state) {
                  if (state is BlogLoading) {
                    return loadingWidget();
                  } else if (state is BlogSuccess) {
                    return state.blogs.isNotEmpty
                        ? NewsItemWeb(
                          height: widget.height,
                          width: widget.width,
                          blogs: state.blogs,
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
    return Skeletonizer(
      enabled: true,
      child: NewsItemWeb(
        blogs: blogs,
        height: widget.height,
        width: widget.width,
      ),
    );
  }
}
