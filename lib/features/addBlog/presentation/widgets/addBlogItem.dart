import 'dart:io';

import 'package:codia_adv/features/addBlog/presentation/widgets/textFormField.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/utils/appColors.dart';
import '../../../../config/utils/appConstants.dart';
import '../../domain/entities/blogEntity.dart';
import '../../data/data_sources/remote/remoteDS.dart';
import '../../data/data_sources/remote/remoteDSIMPL.dart';
import '../../data/repositories/blogDataRepo.dart';
import '../../domain/entities/validator.dart';
import '../../domain/repositories/blogDomainRepo.dart';
import '../../domain/use_cases/blogUseCase.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';

class AddBlogItem extends StatefulWidget {
     final TextEditingController headlineController;
    final TextEditingController descriptionController;
    final TextEditingController facebookController;
    final TextEditingController googlePlayController;
    final TextEditingController amazonController;
    final TextEditingController appStoreController;
    final TextEditingController linkedinController;


      AddBlogItem({
      super.key,
      required this.headlineController,
      required this.descriptionController,
      required this.facebookController,
      required this.googlePlayController,
      required this.amazonController,
      required this.appStoreController,
      required this.linkedinController,
      });
  @override
  State<AddBlogItem> createState() => _AddBlogItemState();
}

class _AddBlogItemState extends State<AddBlogItem> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;  // هنا داخل الحالة فقط


  File? selectedImageFile;





  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      context.read<BlogBloc>().add(PickImageEvent(file));
    }
  }




  Widget _buildImagePicker() {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        File? imageFile;
        if (state is ImagePickedSuccess) {
          imageFile = state.imageFile;
        }
        return GestureDetector(
          onTap: () => _pickImage(context),
          child: Container(
            height: AppConstants.screenHeight * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade100,
              image: imageFile != null
                  ? DecorationImage(
                image: FileImage(imageFile),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: imageFile == null
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.image_outlined, size: 50, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    'Upload Image',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
                : null,
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final RemoteDS remoteDS = RemoteDSIMPL();
    final BlogDomainRepo repo = BlogDataRemoImp(remoteDS);
    final BlogUseCase blogUseCase = BlogUseCase(repo);

    return  SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildImagePicker(),
            const SizedBox(height: 20),
            buildTextField(
                validator: BlogFormValidator.validateHeadline,

                'Headline', widget.headlineController),
            buildTextField(
              validator: BlogFormValidator.validateDescription,

              'Description',
              widget.descriptionController,
              maxLines: 5,
            ),
            _buildDateField(),
            buildTextField('Facebook Link',  widget.facebookController),
            buildTextField(
              'Google Play Link',
              widget.googlePlayController,
            ),
            buildTextField('Amazon Link',  widget.amazonController),
            buildTextField(
              'App Store Link',
              widget.appStoreController,
            ),
             buildTextField('LinkedIn Link',  widget.linkedinController),
            const SizedBox(height: 30),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }





  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(

        readOnly: true,
        controller: TextEditingController(
          text:
         selectedDate != null
                  ?     selectedDate!.toLocal().toString().split(' ')[0]
                  : '',
        ),
        validator: (_) => BlogFormValidator.validateDate(    selectedDate),
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            setState(() {
              selectedDate = picked;
            });
          }
        },
        decoration: InputDecoration(
          labelText: 'Blog Date',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.send),
        label: const Text('Submit Blog'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.adminPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final blog = BlogEntity(
              instagramLink: "",
              id: DateTime
                  .now()
                  .millisecondsSinceEpoch
                  .toString(),
              imageUrl:"",
              headline:  widget.headlineController.text,
              description:  widget.descriptionController.text,
              blogDate:     selectedDate?.toIso8601String() ?? '',
              createdAt: DateTime.now().toIso8601String(),
              facebookLink:  widget.facebookController.text,
              googlePlayLink:  widget.googlePlayController.text,
              amazonLink:  widget.amazonController.text,
              appStoreLink: widget.appStoreController.text,
              linkedinLink:  widget.linkedinController.text,
            );

            context.read<BlogBloc>().add(SubmitBlogEvent(blog: blog));

          }
        }
      ),
    );
  }

}
