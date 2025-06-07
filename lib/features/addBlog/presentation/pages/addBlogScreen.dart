import 'package:codia_adv/features/addBlog/data/data_sources/remote/remoteDS.dart';
import 'package:codia_adv/features/addBlog/data/data_sources/remote/remoteDSIMPL.dart';
import 'package:codia_adv/features/addBlog/data/repositories/blogDataRepo.dart';
import 'package:codia_adv/features/addBlog/domain/repositories/blogDomainRepo.dart';
import 'package:codia_adv/features/addBlog/domain/use_cases/blogUseCase.dart';
import 'package:codia_adv/features/addBlog/domain/use_cases/uploadImageUseCase.dart';
import 'package:codia_adv/features/addBlog/presentation/bloc/bloc.dart';
import 'package:codia_adv/features/addBlog/presentation/bloc/states.dart';
import 'package:codia_adv/features/addBlog/presentation/widgets/addBlogItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBlogScreen extends StatelessWidget {
  const AddBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RemoteDS remoteDS = RemoteDSIMPL();
    final BlogDomainRepo repo = BlogDataRemoImp(remoteDS);
    final BlogUseCase blogUseCase = BlogUseCase(repo);
    final UploadImageUseCase uploadImageUseCase = UploadImageUseCase(repo);
    final _headlineController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _facebookController = TextEditingController();
    final _googlePlayController = TextEditingController();
    final _amazonController = TextEditingController();
    final _appStoreController = TextEditingController();
    final _linkedinController = TextEditingController();
    DateTime? selectedDate;

    void clearAllControllers() {
      _headlineController.clear();
      _descriptionController.clear();
      _facebookController.clear();
      _googlePlayController.clear();
      _amazonController.clear();
      _appStoreController.clear();
      _linkedinController.clear();
    }
    return BlocProvider(
      create: (context) => BlogBloc(
          uploadImageUseCase: uploadImageUseCase,
          submitBlogUseCase: blogUseCase),
      child: BlocListener<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogSuccess) {
            clearAllControllers();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Blog submitted successfully",style: TextStyle(
                    color: Colors.white
                  ),)),
            );
            // Navigator.pop(context);
          }  if (state is BlogFailure) {
            ScaffoldMessenger.of(context).showSnackBar(

              SnackBar(
                  content: Text("Submission failed: ${state.error}")),
            );
          }
        },
        child: BlocBuilder<BlogBloc, BlogState>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is BlogLoading,
              child: Stack(
                children: [
                  AddBlogItem(
                    amazonController: _amazonController,
                    appStoreController: _appStoreController,
                    descriptionController: _descriptionController,
                    googlePlayController: _googlePlayController,
                    facebookController: _facebookController,
                    headlineController: _headlineController,
                    linkedinController: _linkedinController,
                   ),
                  if (state is BlogLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}
