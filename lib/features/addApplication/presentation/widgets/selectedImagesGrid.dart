import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../bloc/bloc.dart'; // Bloc class
import '../bloc/events.dart';
import '../bloc/states.dart';

class SelectableImageGrid extends StatelessWidget {
  const SelectableImageGrid({super.key});

  Future<void> _pickImage(BuildContext context, int index) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      BlocProvider.of<AddAppBloc>(context).add(
        PickImageAtIndex(index: index, imageFile: File(pickedFile.path)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAppBloc, AddAppState>(
      builder: (context, state) {
        List<File?> selectedImages = context.read<AddAppBloc>().selectedImages;

        return GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final image = selectedImages[index];
            return GestureDetector(
              onTap: () => _pickImage(context, index),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: image == null
                    ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_a_photo, size: 30, color: Colors.grey),
                      SizedBox(height: 8),
                      Text("Add Image", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
