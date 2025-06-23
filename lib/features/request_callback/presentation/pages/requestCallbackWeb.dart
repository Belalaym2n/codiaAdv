import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/utils/appImages.dart';
import '../../../contactUs/footor.dart';
import '../../../core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import '../../domain/entities/callbackModel.dart';
import '../../domain/entities/validator.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../widgets/sharedWidget/button.dart';
import '../widgets/sharedWidget/textFormField.dart';
import '../widgets/sharedWidget/texts.dart';
import '../widgets/web/requestCallbackWebItem.dart';

class RequestCallbackWeb extends StatefulWidget {
  RequestCallbackWeb({
    super.key,
    required this.h,
    required this.w,

    required this.phoneController,
    required this.nameController,
    required this.messageController,
    required this.emailController,
  });

  double h;
  double w;
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
    return Column(
      children: [
        WebHeader(width: widget.w, height: widget.h),

        RequestCallbackWebItem(
          nameController: widget.nameController,
          phoneController: widget.phoneController,
          emailController: widget.emailController,
          messageController: widget.messageController,

          h: widget.h,
          w: widget.w,
        ),
      ],
    );
  }
}
