


import 'package:codia_adv/features/addBlog/domain/entities/blogEntity.dart';

class BlogModel {
  final String id;
  final String imageUrl;
  final String instagramLink;
  final String headline;
  final String description;
  final String blogDate;
  final String? facebookLink;
  final String? googlePlayLink;
  final String? amazonLink;
  final String? appStoreLink;
  final String? linkedinLink;
  final String createdAt;

  BlogModel({
    required this.id,
    required this.imageUrl,
    required this.instagramLink,
    required this.headline,
    required this.description,
    required this.blogDate,
    required this.createdAt,
    this.facebookLink,
    this.googlePlayLink,
    this.amazonLink,
    this.appStoreLink,
    this.linkedinLink,
  });

  factory BlogModel.fromEntity(BlogEntity entity) {
    return BlogModel(
      id: entity.id,
      instagramLink: entity.instagramLink,
      imageUrl: entity.imageUrl,
      headline: entity.headline,
      description: entity.description,
      blogDate: entity.blogDate,
      facebookLink: entity.facebookLink,
      googlePlayLink: entity.googlePlayLink,
      amazonLink: entity.amazonLink,
      appStoreLink: entity.appStoreLink,
      linkedinLink: entity.linkedinLink,
      createdAt: entity.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "image_url": imageUrl,
      "headline": headline,
      "description": description,
      "blog_date": blogDate,
      "facebook_link": facebookLink,
      "google_play_link": googlePlayLink,
      "amazon_link": amazonLink,
      "app_store_link": appStoreLink,
      "linkedin_link": linkedinLink,
      "createdAt": createdAt,
    };
  }
}
