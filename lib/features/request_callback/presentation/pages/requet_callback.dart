import 'package:codia_adv/config/utils/appImages.dart';
import 'package:codia_adv/features/contactUs/footor.dart';
import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import 'package:codia_adv/features/homePage/presentation/homePageItem.dart';
import 'package:codia_adv/features/request_callback/data/repositories/requestCallbackRepoImp.dart';
import 'package:codia_adv/features/request_callback/presentation/bloc/states.dart';
import 'package:codia_adv/features/request_callback/presentation/pages/requestCallbackWeb.dart';
import 'package:codia_adv/features/request_callback/presentation/widgets/sharedWidget/successWidget.dart';
import 'package:codia_adv/routing/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/remoteDS/remoteDSImp.dart';
import '../../domain/repositories/requestCallbackRepo.dart';
import '../../domain/use_cases/requestCallbackUseCase.dart';
import '../bloc/bloc.dart';

class RequestCallback extends StatefulWidget {
  const RequestCallback({super.key});

  @override
  State<RequestCallback> createState() => _RequestCallbackState();
}

class _RequestCallbackState extends State<RequestCallback> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    bool isDesktop(double width) => width >= 1280;
    bool isTablet(double width) => width >= 600 && width < 1280;
    bool isMobile(double width) => width < 600;
    RequestCallbackRemoteDSI requestCallbackRemoteDSI =
        RequestCallbackRemoteDSI();
    RequestCallbackRepo requestCallbackRepo = RequestCallbackRepoIMP(
      requestCallbackRemoteDSI,
    );
    RequestCallbackUseCase requestCallbackUseCase = RequestCallbackUseCase(
      requestCallbackRepo,
    );
    return BlocProvider(
      create: (context) => RequestCallBackBloc(requestCallbackUseCase),

      child: BlocListener<RequestCallBackBloc, RequestCallbackState>(
        listener: (context, state) {
          if (state is RequestCallbackError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is RequestCallbackSuccess) {
            nameController.clear();
            emailController.clear();
            phoneController.clear();
            messageController.clear();

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SuccessWidgetDesktop(h: h,w: w,)),
                  (route) => route.isFirst,
            );
          }
        },
        child: BlocBuilder<RequestCallBackBloc, RequestCallbackState>(
          builder: (context, state) {
            return AbsorbPointer(
                absorbing: state is RequestCallbackLoading,
                child: Scaffold(
                body: Stack(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final w = constraints.maxWidth;
                        final h = constraints.maxHeight;

                        if (isDesktop(w)) {
                          return RequestCallbackWeb(
                            nameController: nameController,
                            phoneController: phoneController,
                            emailController: emailController,
                            messageController: messageController,

                            h: h,
                            w: w,
                          );
                        } else {
                          return Container();
                        }
                        return Container();
                      },
                    ),
                    if (state is RequestCallbackLoading)
                      Center(child: CircularProgressIndicator()),
                  ],
                ),
                                ),
            );
          },
        ),
      ),
    );
  }
}
