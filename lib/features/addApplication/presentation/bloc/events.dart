import 'dart:io';

import '../../domain/entities/applicationEntity.dart';

abstract class AddAppEvents {}

class PickImageAtIndex extends AddAppEvents {
  final int index;
  final File imageFile;

  PickImageAtIndex({
    required this.index,
    required this.imageFile,
  });
}
class SubmitAppEvent extends AddAppEvents {
  final String headline;
  final String description;
  final List<File> images;

  SubmitAppEvent({
    required this.headline,
    required this.description,
    required this.images,
  });
}