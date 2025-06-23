import 'dart:io';

import 'package:codia_adv/features/addApplication/presentation/bloc/bloc.dart';
import 'package:codia_adv/features/addApplication/presentation/bloc/events.dart';
import 'package:codia_adv/features/addApplication/presentation/widgets/selectedImagesGrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/utils/appColors.dart';
import '../../../addBlog/domain/entities/validator.dart';
import '../../../addBlog/presentation/widgets/textFormField.dart';

class AddApplicationItem extends StatefulWidget {
  final TextEditingController headlineController;
  final TextEditingController descriptionController;

  AddApplicationItem({
    super.key,
    required this.headlineController,
    required this.descriptionController,
  });

  @override
  State<AddApplicationItem> createState() => _AddApplicationItemState();
}

class _AddApplicationItemState extends State<AddApplicationItem> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Form(
        key: _formKey,
        child: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          child: Column(
            children: [
              SelectableImageGrid(),
              Padding(
                padding:const EdgeInsets.symmetric(
                    horizontal:
                    10.0),
                child: buildTextField(
                  validator: BlogFormValidator.validateHeadline,

                  'Headline',
                  widget.headlineController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal:
                    10.0),
                child: buildTextField(
                  validator: BlogFormValidator.validateDescription,

                  'Description',
                  widget.descriptionController,
                  maxLines: 5,
                ),
              ),
          Padding(
            padding:const EdgeInsets.symmetric(
                horizontal:
                10.0),child:   _buildSubmitButton(),
          )],
          ),
        ),
      )),
    );
  }
  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
          icon: const Icon(Icons.send,color: Colors.white,),
          label: const Text('Submit Blog',style: TextStyle(
            color: Colors.white
          ),),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.adminPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final selectedImages = context.read<AddAppBloc>().selectedImages.
                whereType
                <File>().toList();



                context.read<AddAppBloc>().add(SubmitAppEvent(
                  headline: widget.headlineController.text.trim(),
                  description: widget.descriptionController.text.trim(),
                  images: selectedImages,
                ));
              }


          }
      ),
    );
  }

}
