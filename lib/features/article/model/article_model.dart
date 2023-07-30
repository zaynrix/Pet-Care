part of article_module;

class ArticleModel {
  ArticleModel({
    required this.description,
    required this.createdAt,
    required this.title,
    required this.id,
    required this.content,
    required this.updatedAt,
    required this.isPublished,
    required this.petCategory,
    required this.imagePath,
  });

  final String id;
  final String title;
  final String content;
  final String description;
  final bool isPublished;
  final String petCategory;
  final String createdAt;
  final String updatedAt;
  final String imagePath;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      description: json["description"],
      createdAt: json["createdAt"],
      title: json["title"],
      id: json["id"],
      content: json["content"],
      updatedAt: json["updatedAt"],
      isPublished: json["isPublished"],
      petCategory: json["petCategory"],
      imagePath: json["petCategory"]);
}
