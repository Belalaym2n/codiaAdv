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
import '../widgets/button.dart';
import '../widgets/textFormField.dart';
import '../widgets/texts.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WebHeader(),

        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: widget.w * 0.07),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 🟢 Left: Text + Form
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: widget.h * 0.04),
                              requestCallbackHeadline(
                                fontSize: widget.w * 0.026,
                              ),
                              const SizedBox(height: 12),
                              requestCallbackDescription(
                                fontSize: widget.w * 0.011,
                              ),
                              SizedBox(height: widget.h * 0.03),

                              buildInput(
                                validator:
                                    RequestCallbackValidation.validateName,

                                hint: 'Your Name',
                                icon: Icons.person,
                                controller: widget.nameController,
                              ),
                              SizedBox(height: widget.h * 0.018),

                              buildInput(
                                hint: 'Your Email',
                                icon: Icons.email,
                                controller: widget.emailController,
                                validator:
                                    RequestCallbackValidation.validateEmail,
                              ),
                              SizedBox(height: widget.h * 0.018),

                              buildInput(
                                hint: 'Phone Number',
                                icon: Icons.phone,
                                controller: widget.phoneController,
                                validator:
                                    RequestCallbackValidation.validatePhone,
                              ),
                              SizedBox(height: widget.h * 0.018),

                              buildInput(
                                hint: 'Your Message',
                                icon: Icons.message,
                                controller: widget.messageController,
                                maxLines: 4,
                              ),

                              SizedBox(height: widget.h * 0.03),

                              SizedBox(
                                width: widget.w * 0.2,
                                child: requestButton(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      // لو كل الحقول صحيحة فقط استمر في إرسال البيانات
                                      CallbackEntity callbackEntity =
                                          CallbackEntity(
                                            name: widget.nameController.text,
                                            email: widget.emailController.text,
                                            phone: widget.phoneController.text,
                                            message:
                                                widget.messageController.text,
                                          );
                                      context.read<RequestCallBackBloc>().add(
                                        SubmitCallbackRequest(
                                          callbackEntity: callbackEntity,
                                        ),
                                      );
                                    }
                                  },
                                  fontSize: widget.w * 0.012,
                                  horizontalPadding: widget.h * 0.02,
                                  verticalPadding: widget.w * 0.0157,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: widget.w * 0.06),

                         Expanded(
                          flex: 4,
                          child: Center(
                            child: Image.asset(
                              AppImages.requestCall,
                              width: widget.w * 0.32,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: widget.h * 0.06),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
