import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/tabletHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/sharedWidget/responiveSharedWidget/header/drawer.dart';
import '../../../core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';

import '../widgets/web/requestCallbackWebItem.dart';

class RequestCallbackWeb extends StatefulWidget {
  RequestCallbackWeb({
    super.key,
    required this.h,
    required this.w,
    required this.idDesktop,

    required this.phoneController,
    required this.nameController,
    required this.messageController,
    required this.emailController,
  });

  double h;
  double w;
  bool idDesktop;
  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController messageController;
  TextEditingController emailController;

  @override
  State<RequestCallbackWeb> createState() => _RequestCallbackWebState();
}

class _RequestCallbackWebState extends State<RequestCallbackWeb> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer:  Drawer(
        child: DrawerScreen(
        width: widget.w,
        height: widget.h,
    ),
    ),
    body: Column(
      children: [
       widget.idDesktop?
        WebHeader(width: widget.w, height: widget.h):TabletHeader(width: widget.w, height: widget.h),

        RequestCallbackWebItem(
          isDesktop: widget.idDesktop,
          nameController: widget.nameController,
          phoneController: widget.phoneController,
          emailController: widget.emailController,
          messageController: widget.messageController,
          h: widget.h,
          w: widget.w,
        ),
      ],
    ));
  }
}
