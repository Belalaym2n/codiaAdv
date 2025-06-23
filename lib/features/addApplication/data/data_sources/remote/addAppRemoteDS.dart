import 'dart:io';

import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addApplication/data/models/applicationModel.dart';

abstract class AddAppRemoteDS{


 Future<Result> addApp(ApplicationModel application);
 Future<Result> uploadImage(File image);
}