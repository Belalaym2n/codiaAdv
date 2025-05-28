class BlogEntity {
  String? image;
  String? headLine;
  String? description;
  String? date;

  BlogEntity({this.image, this.headLine, this.description, this.date});

   factory BlogEntity.fromJson(Map<String, dynamic> json) {
    return BlogEntity(
      image: json['image'] as String?,
      headLine: json['headLine'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'image': image,
      'headLine': headLine,
      'description': description,
      'date': date,
    };
  }
}
