import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:codia_adv/features/addApplication/data/models/applicationModel.dart';

import '../../../../../config/error_handling/errorHandling.dart';
import 'getAppsRemoteDS.dart';

class GetAppsRDImp implements GetAppsRemoteDS {
  @override
  Future<Result<List<ApplicationModel>>> getApps() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("Applications")
          .withConverter<ApplicationModel>(
        fromFirestore: (snapshot, _) =>
            ApplicationModel.fromJson( snapshot.data()!),
        toFirestore: ApplicationModel.toFirestore,
      )
          .get();

      final apps = snapshot.docs.map((doc) => doc.data()).toList();

      return Result.success(apps);
    } catch (e) {
      return Result.failure(e.toString());
     }
  }
}
