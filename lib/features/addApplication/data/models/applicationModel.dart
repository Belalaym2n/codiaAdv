import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';

class ApplicationModel {
  final String headline;
  final String description;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String? message;

  ApplicationModel({
    required this.headline,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    this.message,
  });
  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      headline: json['headline'] ?? '',
      description: json['description'] ?? '',
      image1: json['image1'] ?? '',
      image2: json['image2'] ?? '',
      image3: json['image3'] ?? '',
      image4: json['image4'] ?? '',
      message: json['message'], // nullable
    );
  }


  factory ApplicationModel.fromEntity(ApplicationEntity application) {
    return ApplicationModel(
      headline: application.headline,
      description: application.description,
      image1: application.image1,
      image2: application.image2,
      image3: application.image3,
      image4: application.image4,
      message: application.message,
    );
  }


  static Map<String, dynamic> toFirestore(ApplicationModel app, _) => app.toJson();
   Map<String, dynamic> toJson() {
    return {
      'headline': headline,
      'description': description,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      if (message != null) 'message': message,
    };
  }
}
