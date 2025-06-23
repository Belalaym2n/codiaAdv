import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import '../../../../contactUs/footor.dart';
import '../../data/data_sources/remoteDs/remoteDSIMP.dart';
import '../../data/repositories/dataRepoImpementation.dart';
import '../../domain/use_cases/blogUseCase.dart';
import '../bloc/blogBloc.dart';
import '../bloc/blogEvents.dart';
import 'new_screen_web.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool isDesktop(double width) => width >= 1280;
  bool isTablet(double width) => width >= 600 && width < 1280;
  bool isMobile(double width) => width < 600;
  @override
  Widget build(BuildContext context) {
     final remoteDs = RemoteDSIMP();
  final blogRepo = BlogRepoImpl(remoteDs: remoteDs);
  final blogUseCase = BlogUseCase(blogRepo);

  return BlocProvider(
      create: (_) => BlogBloc.getInstance(blogUseCase: blogUseCase)..add(BlogTabTabbedEvents()),
    child:  LayoutBuilder(
        builder: (context, constraints) {

      final width = constraints.maxWidth;
      final h = MediaQuery.of(context).size.height; // ✅ التعديل هنا
      final w = MediaQuery.of(context).size.width; // ✅ التعديل هنا

      if(isDesktop(width)){
        return NewsScreenWeb(
          width: w,
          height: h,
        );
      }
      return Container();
     }));
  }
}
