import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/blog/news/data/data_sources/remoteDs/remoteDs.dart';
import 'package:codia_adv/features/blog/news/domain/entities/blogEntity.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/blog/news/data/data_sources/remoteDs/remoteDs.dart';
import 'package:codia_adv/features/blog/news/domain/entities/blogEntity.dart';

class RemoteDSIMP implements RemoteDs {
  @override
  Future<Result<List<BlogEntity>>> fetchBlogs() async {
    try {
      final blogRef = FirebaseFirestore.instance
          .collection("blogDevelopment")
          .withConverter<BlogEntity>(
        fromFirestore: (snapshot, _) =>
            BlogEntity.fromJson(snapshot.data()!),
        toFirestore: (blog, _) => blog.toJson(),
      );

      final querySnapshot = await blogRef.get();

      final blogs = querySnapshot.docs
          .map((doc) => doc.data()) // تحويل كل مستند إلى BlogEntity
          .toList();

      return Result.success(blogs);
    } catch (e) {
      print("Error fetching blogs: ${e.toString()}");
      return Result.failure("Error: ${e.toString()}");
    }
  }
}
