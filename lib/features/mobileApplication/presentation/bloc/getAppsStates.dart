import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';

class GetAppsStates{}
class GetAppsInitialState extends GetAppsStates{}
class  GetAppsLoading extends  GetAppsStates{}
class  GetAppsSuccess extends  GetAppsStates{
  List<ApplicationEntity>apps;
  GetAppsSuccess(this.apps);
}
class  GetAppsFailure  extends  GetAppsStates{
  final String error;
  GetAppsFailure(this.error);
}