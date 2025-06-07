import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addBlog/data/data_sources/remote/remoteDS.dart';
import 'package:codia_adv/features/addBlog/data/models/blogModel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RemoteDSIMPL implements RemoteDS {
  @override
  Future<Result> submitBlog(BlogModel blog) async {
    try {
      final item = FirebaseFirestore.instance
          .collection("Blogs")
          .doc(blog.id)
          .set(blog.toJson());

      return Result.success(item);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result> uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref(
        'blogs/${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      final uploadTask = await storageRef.putFile(image);
      final url = await uploadTask.ref.getDownloadURL();
      return Result.success(url);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
