

import 'dart:io';

import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';

import '../../../../config/error_handling/errorHandling.dart';

abstract class AddAppRepo{

 Future<Result> addApp(ApplicationEntity app);
 Future<Result> uploadImage(File image);

}