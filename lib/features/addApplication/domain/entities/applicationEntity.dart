import '../../data/models/applicationModel.dart';

class ApplicationEntity {
  final String headline;
  final String description;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String? message;
  final String? amazone_url;
  final String? google_plauurl;
  final String? app_store_url;

  ApplicationEntity({
    required this.headline,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    this.message,
    this.amazone_url,
    this.google_plauurl,
    this.app_store_url,
  });

  factory ApplicationEntity.toEntity(ApplicationModel application) {
    return ApplicationEntity(
      headline: application.headline,
      description: application.description,
      image1: application.image1,
      image2: application.image2,
      image3: application.image3,
      image4: application.image4,
      app_store_url: application.app_store_url,
      amazone_url: application.amazone_url,
      google_plauurl: application.google_plauurl,
    );
  }

  ApplicationEntity copyWith({
    String? headline,
    String? description,
    String? image1,
    String? image2,
    String? image3,
    String? image4,
    String? message,
    String? google_plauurl,
    String? appStore,
    String? amazon,
  }) {
    return ApplicationEntity(
      app_store_url: appStore??this.app_store_url,
      google_plauurl:google_plauurl??this.google_plauurl ,
      amazone_url: amazon??this.amazone_url,
      headline: headline ?? this.headline,
      description: description ?? this.description,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      image3: image3 ?? this.image3,
      image4: image4 ?? this.image4,
      message: message ?? this.message,
    );
  }
}
