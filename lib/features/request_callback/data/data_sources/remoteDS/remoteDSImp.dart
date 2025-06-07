import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/request_callback/data/data_sources/remoteDS/requestCallRDS.dart';
import 'package:codia_adv/features/request_callback/data/models/requestCallbackModel.dart';

class RequestCallbackRemoteDSI implements RequestCallRemoteDS{
  @override
  Future<Result> submitRequest(RequestCallbackModel model) async {
    try {
      final collection = FirebaseFirestore.instance
          .collection("Requests")
          .withConverter<RequestCallbackModel>(
        fromFirestore: (snapshot, _) => RequestCallbackModel.fromJson(
            snapshot.data()!),
        toFirestore: (request, _) => request.toJson(),
      );

      await collection.add(model); // إضافة البيانات

      return Result.success("Success"); // أو أي object يمثل نجاح العملية
    } catch (e) {
       return Result.failure(e.toString());
    }
  }

}