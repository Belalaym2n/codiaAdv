class GetBlogEntity {
  final String id;
  final String imageUrl;
  final String headline;
  final String description;
  final String blogDate;
  final String createdAt;
  final String facebookLink;
  final String instagramLink;
  final String googlePlayLink;
  final String amazonLink;
  final String appStoreLink;
  final String linkedinLink;

  GetBlogEntity({
    required this.id,
    required this.instagramLink,
    required this.imageUrl,
    required this.headline,
    required this.description,
    required this.blogDate,
    required this.createdAt,
    required this.facebookLink,
    required this.googlePlayLink,
    required this.amazonLink,
    required this.appStoreLink,
    required this.linkedinLink,
  });

  factory GetBlogEntity.fromJson(Map<String, dynamic> json) {
    return GetBlogEntity(
      id: json['id'] ?? '',
      imageUrl: json['image_url'] ?? '',
      instagramLink: json['instagramLink'] ?? '',
      headline: json['headline'] ?? '',
      description: json['description'] ?? '',
      blogDate: json['blog_date'] ?? '',
      createdAt: json['createdAt'] ?? '',
      facebookLink: json['facebook_link'] ?? '',
      googlePlayLink: json['google_play_link'] ?? '',
      amazonLink: json['amazon_link'] ?? '',
      appStoreLink: json['app_store_link'] ?? '',
      linkedinLink: json['linkedin_link'] ?? '',
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'headline': headline,
      'description': description,
      'blogDate': blogDate,
      'createdAt': createdAt,
      'facebookLink': facebookLink,
      'googlePlayLink': googlePlayLink,
      'amazonLink': amazonLink,
      'appStoreLink': appStoreLink,
      'linkedinLink': linkedinLink,
    };
  }
}
