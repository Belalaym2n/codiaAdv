import 'package:codia_adv/features/addApplication/data/data_sources/remote/addAppRemoteDS.dart';
import 'package:codia_adv/features/addApplication/data/data_sources/remote/remoteDSIMP.dart';
import 'package:codia_adv/features/addApplication/data/repositories/addAppRepoImp.dart';
import 'package:codia_adv/features/addApplication/domain/repositories/addAppRepo.dart';
import 'package:codia_adv/features/addApplication/domain/use_cases/addAppUseCase.dart';
import 'package:codia_adv/features/addApplication/presentation/bloc/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/uploadImagesForApp.dart';
import '../bloc/bloc.dart';
import '../widgets/addApplicationItem.dart';

class AddApplication extends StatefulWidget {
  const AddApplication({super.key});

  @override
  State<AddApplication> createState() => _AddApplicationState();
}
final _headlineController = TextEditingController();
final _descriptionController = TextEditingController();
class _AddApplicationState extends State<AddApplication> {

  @override
  Widget build(BuildContext context) {
    final AddAppRemoteDS remoteDS = AddAppRemoteDSIMP();
    final AddAppRepo repo = AddAppRepoIMP(remoteDS);
    final AddAppUseCase blogUseCase = AddAppUseCase(repo);
    final UploadAppImagesUseCase appImagesUseCase = UploadAppImagesUseCase(repo);
     final _headlineController = TextEditingController();
    final _descriptionController = TextEditingController();

    void clearAllControllers() {
      _headlineController.clear();
      _descriptionController.clear();

    }
    return BlocProvider(
      create: (context) => AddAppBloc(
          addAppUseCase: blogUseCase, uploadImageUseCase: appImagesUseCase,
       ),
      child: BlocListener<AddAppBloc, AddAppState>(
        listener: (context, state) {
          if (state is AddAppSuccess) {
            clearAllControllers();
            context.read<AddAppBloc>().selectedImages = List.filled(4, null);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Blog submitted successfully",style: TextStyle(
                      color: Colors.white
                  ),)),
            );
            // Navigator.pop(context);
          }  if (state is AddAppFailure) {
            ScaffoldMessenger.of(context).showSnackBar(

              SnackBar(
                  content: Text("Submission failed: ${state.error}")),
            );
          }
        },
        child: BlocBuilder<AddAppBloc, AddAppState>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddAppLoading,
              child: Stack(
                children: [
                  AddApplicationItem(
                     descriptionController: _descriptionController,
                      headlineController: _headlineController,
                   ),
                  if (state is AddAppLoading)
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
