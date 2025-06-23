import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addApplication/data/data_sources/remote/addAppRemoteDS.dart';
import 'package:codia_adv/features/addApplication/data/models/applicationModel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddAppRemoteDSIMP implements AddAppRemoteDS {
  @override
  Future<Result> addApp(ApplicationModel application) async {
    try {
      await FirebaseFirestore.instance.collection("Applications").doc().set(
          application.toJson());
      return Result.success("Success");
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result> uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref(
        'Apps/${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      final uploadTask = await storageRef.putFile(image);
      final url = await uploadTask.ref.getDownloadURL();
      return Result.success(url);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

}