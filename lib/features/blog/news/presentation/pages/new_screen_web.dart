import 'package:codia_adv/features/blog/news/data/data_sources/remoteDs/remoteDSIMP.dart';
import 'package:codia_adv/features/blog/news/data/data_sources/remoteDs/remoteDs.dart';
import 'package:codia_adv/features/blog/news/domain/entities/blogEntity.dart';
import 'package:codia_adv/features/blog/news/domain/repositories/blogDomainUseCase.dart';
import 'package:codia_adv/features/blog/news/domain/use_cases/blogUseCase.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogBloc.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogEvents.dart';
import 'package:codia_adv/features/blog/news/presentation/bloc/blogStates.dart';
import 'package:codia_adv/features/blog/news/presentation/widgets/newsItem.dart';
import 'package:codia_adv/features/contactUs/footor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../homePage/widgets/header.dart';
import '../../data/repositories/dataRepoImpementation.dart';

class NewsScreenWeb extends StatefulWidget {
  NewsScreenWeb({super.key,required this.height,
  required this.width
  });
  double height;
  double width;

  @override
  State<NewsScreenWeb> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreenWeb> {
  @override
  Widget build(BuildContext context) {
    RemoteDs remoteDs = RemoteDSIMP();
    BlogDomainRepo blogDomainRepo = BlogRepoImpl(remoteDs: remoteDs);
    BlogUseCase blogUseCase = BlogUseCase(blogDomainRepo);
    return  Scaffold(
      body: Column(
        children: [
          CustomHeader(),  // هنا الـ Header ثابت فوق
          SizedBox(height: 50),

           Expanded(
            child: BlocBuilder<BlogBloc, BlogStates>(
              builder: (context, state) {
                if (state is BlogLoading) {
                  return loadingWidget();
                } else if (state is BlogSuccess) {
                  return state.blogs.isNotEmpty
                      ? NewsItem(
                    height: widget.height,
                    width: widget.width,
                    blogs: state.blogs,
                  )
                      : Center(
                    child: Text("No blogs available"),
                  );
                } else if (state is BlogFailure) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),




        ],
      ),
    );
  }




  List<GetBlogEntity>blogs=[
     GetBlogEntity(
         instagramLink: "instagramLink",
         id: "id",
        imageUrl: "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",
        headline: "headline", description: "There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs.There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs. There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs.There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs. There are a number of reasons why errors may occur on download, including the file not existing, or the user not having permission to access the desired file. More information on errors can be found in the Handle Errors section of the docs."
        ,
        blogDate: "blogDate", createdAt: "createdAt", facebookLink:
        "facebookLink", googlePlayLink: "googlePlayLink", amazonLink: "amazonLink", appStoreLink: "appStoreLink"
        , linkedinLink: "linkedinLink")
  ];
  Widget loadingWidget() {
    return Skeletonizer(
      enabled: true,
      child: NewsItem(
        blogs: blogs,
        height: widget.height,
        width: widget.width,
      ),
    );
  }

}
