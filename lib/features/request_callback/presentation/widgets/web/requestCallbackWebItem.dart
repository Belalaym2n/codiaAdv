import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/utils/appImages.dart';
import '../../../domain/entities/callbackModel.dart';
import '../../../domain/entities/validator.dart';
import '../../bloc/bloc.dart';
import '../../bloc/events.dart';
import '../sharedWidget/button.dart';
import '../sharedWidget/textFormField.dart';
import '../sharedWidget/texts.dart';
import 'package:codia_adv/features/footor/presentation/pages/footor_web.dart';

class RequestCallbackWebItem extends StatefulWidget {
  const RequestCallbackWebItem({
    super.key,
    required this.h,
    required this.w,
    required this.phoneController,
    required this.nameController,
    required this.messageController,
    required this.emailController,
  });

  final double h;
  final double w;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController messageController;
  final TextEditingController emailController;

  @override
  State<RequestCallbackWebItem> createState() => _RequestCallbackItemState();
}

class _RequestCallbackItemState extends State<RequestCallbackWebItem> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: widget.h * 0.04),
                          FadeInDown(
                            delay: const Duration(milliseconds: 100),
                            child: requestCallbackHeadline(
                                fontSize: widget.w * 0.026),
                          ),
                          const SizedBox(height: 12),
                          FadeInDown(
                            delay: const Duration(milliseconds: 300),
                            child: requestCallbackDescription(
                                fontSize: widget.w * 0.011),
                          ),
                          SizedBox(height: widget.h * 0.03),
                          SlideInLeft(
                            delay: const Duration(milliseconds: 500),
                            child: buildInput(
                              validator:
                              RequestCallbackValidation.validateName,
                              hint: 'Your Name',
                              icon: Icons.person,
                              controller: widget.nameController,
                            ),
                          ),
                          SizedBox(height: widget.h * 0.018),
                          SlideInLeft(
                            delay: const Duration(milliseconds: 700),
                            child: buildInput(
                              hint: 'Your Email',
                              icon: Icons.email,
                              controller: widget.emailController,
                              validator:
                              RequestCallbackValidation.validateEmail,
                            ),
                          ),
                          SizedBox(height: widget.h * 0.018),
                          SlideInLeft(
                            delay: const Duration(milliseconds: 900),
                            child: buildInput(
                              hint: 'Phone Number',
                              icon: Icons.phone,
                              controller: widget.phoneController,
                              validator:
                              RequestCallbackValidation.validatePhone,
                            ),
                          ),
                          SizedBox(height: widget.h * 0.018),
                          SlideInLeft(
                            delay: const Duration(milliseconds: 1100),
                            child: buildInput(
                              hint: 'Your Message',
                              icon: Icons.message,
                              controller: widget.messageController,
                              maxLines: 4,
                            ),
                          ),
                          SizedBox(height: widget.h * 0.03),
                          FadeInUp(
                            delay: const Duration(milliseconds: 1300),
                            child: buildSubmitButton(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: widget.w * 0.06),
                    ZoomIn(
                      delay: const Duration(milliseconds: 1000),
                      duration: const Duration(milliseconds: 1000),
                      child: buildImage(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: widget.h * 0.06),
              FadeInUp(
                delay: const Duration(milliseconds: 1600),
                child: FootorWeb(w: widget.w, h: widget.h),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Expanded(
      flex: 4,
      child: Center(
        child: Image.asset(
          AppImages.requestCall,
          width: widget.w * 0.32,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return SizedBox(
      width: widget.w * 0.2,
      child: requestButton(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            CallbackEntity callbackEntity = CallbackEntity(
              name: widget.nameController.text,
              email: widget.emailController.text,
              phone: widget.phoneController.text,
              message: widget.messageController.text,
            );
            context.read<RequestCallBackBloc>().add(
              SubmitCallbackRequest(callbackEntity: callbackEntity),
            );
          }
        },
        fontSize: widget.w * 0.012,
        horizontalPadding: widget.h * 0.02,
        verticalPadding: widget.w * 0.0157,
      ),
    );
  }
}
