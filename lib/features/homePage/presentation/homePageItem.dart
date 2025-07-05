import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blog/news/data/data_sources/remoteDs/remoteDSIMP.dart';
import '../../blog/news/data/repositories/dataRepoImpementation.dart';
import '../../blog/news/domain/use_cases/blogUseCase.dart';
import '../../blog/news/presentation/bloc/blogBloc.dart';
import '../../blog/news/presentation/bloc/blogEvents.dart';
import '../../core/sharedWidget/responiveSharedWidget/header/headerMobile.dart';
import '../../core/sharedWidget/responiveSharedWidget/header/tabletHeader.dart';

import 'homePageTablet.dart';
import 'homePageWeb.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({super.key});

  @override
  Widget build(BuildContext context) {

    bool isDesktop(double width) => width >= 1024;
    bool isTablet(double width) => width >= 600 && width < 1024;
    bool isMobile(double width) => width < 600;

    final remoteDs = RemoteDSIMP();
    final blogRepo = BlogRepoImpl(remoteDs: remoteDs);
    final blogUseCase = BlogUseCase(blogRepo);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFAFAFA), Color(0xFFF0F0F0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BlocProvider(
          create:
              (_) =>
                  BlogBloc.getInstance(blogUseCase: blogUseCase)
                    ..add(BlogTabTabbedEvents()),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final h = constraints.maxHeight;
              if (isDesktop(w)) {
                return HomePageWeb(w: w, h: h);
              } else if (isTablet(w)) {
                return HomePageTablet(w: w, h: h);
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
