import '../../domain/entities/callbackModel.dart';

class RequestCallbackModel{
  String name;
  String email;
  String phone;
  String message;

  RequestCallbackModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
  });

  factory RequestCallbackModel.fromJson(Map<String, dynamic> json) {
    return RequestCallbackModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      message: json['message'] ?? '',
    );
  }

  factory RequestCallbackModel.fromEntity(CallbackEntity entity) {
    return RequestCallbackModel(
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
      message: entity.message,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'message': message,
    };
  }


}