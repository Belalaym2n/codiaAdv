import 'dart:io';

import 'package:codia_adv/config/error_handling/errorHandling.dart';
import 'package:codia_adv/features/addApplication/data/data_sources/remote/addAppRemoteDS.dart';
import 'package:codia_adv/features/addApplication/data/models/applicationModel.dart';
import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:codia_adv/features/addApplication/domain/repositories/addAppRepo.dart';
import 'package:codia_adv/features/addBlog/data/data_sources/remote/remoteDS.dart';

class AddAppRepoIMP implements AddAppRepo {
  AddAppRemoteDS remoteDS;

  AddAppRepoIMP(this.remoteDS);

  @override
  Future<Result> addApp(ApplicationEntity app) {
    return remoteDS.addApp(ApplicationModel.fromEntity(app));
  }

  @override
  Future<Result> uploadImage(File image) {
    // TODO: implement uploadImage
    return remoteDS.uploadImage(image);
  }

}