import 'package:codia_adv/features/blog/news/data/data_sources/remoteDs/remoteDSIMP.dart';
import 'package:codia_adv/features/blog/news/data/data_sources/remoteDs/remoteDs.dart';
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

import '../../../../homePage/widgets/header.dart';
import '../../data/repositories/dataRepoImpementation.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    RemoteDs remoteDs = RemoteDSIMP();
    BlogDomainRepo blogDomainRepo = BlogRepoImpl(remoteDs: remoteDs);
    BlogUseCase blogUseCase = BlogUseCase(blogDomainRepo);
    return Scaffold(
      body: Column(
            children: [
              CustomHeader(),
              SizedBox(height: 50),
    BlocProvider(
      create:
          (context) =>
              BlogBloc(blogUseCase: blogUseCase)..add(BlogTabTabbedEvents()),
      child: BlocBuilder<BlogBloc, BlogStates>(
        builder: (context, state) {
          if (state is BlogLoading) {
            return CircularProgressIndicator();
          } else if (state is BlogSuccess) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (_, index) {
                  final blog = state.blogs[index];
                  print("id ${blog.headLine.toString()}");
                  print("bsdfsd");
                  return ListTile(
                    title: Text(
                      blog.description.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(blog.description.toString()),
                  );
                },
              ),
            );
          } else if (state is BlogFailure) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),)]));

    

  }
}
