class BlogEntity {
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

  BlogEntity({
    required this.id,
    required this.imageUrl,
    required this.headline,
    required this.instagramLink,
    required this.description,
    required this.blogDate,
    required this.createdAt,
    required this.facebookLink,
    required this.googlePlayLink,
    required this.amazonLink,
    required this.appStoreLink,
    required this.linkedinLink,
  });

  BlogEntity copyWith({
    String? id,
    String? imageUrl,
    String? headline,
    String? description,
    String? blogDate,
    String? instagramLink,
    String? createdAt,
    String? facebookLink,
    String? googlePlayLink,
    String? amazonLink,
    String? appStoreLink,
    String? linkedinLink,
  }) {
    return BlogEntity(
      id: id ?? this.id,
      instagramLink: id ?? this.instagramLink,
      imageUrl: imageUrl ?? this.imageUrl,
      headline: headline ?? this.headline,
      description: description ?? this.description,
      blogDate: blogDate ?? this.blogDate,
      createdAt: createdAt ?? this.createdAt,
      facebookLink: facebookLink ?? this.facebookLink,
      googlePlayLink: googlePlayLink ?? this.googlePlayLink,
      amazonLink: amazonLink ?? this.amazonLink,
      appStoreLink: appStoreLink ?? this.appStoreLink,
      linkedinLink: linkedinLink ?? this.linkedinLink,
    );
  }
}
