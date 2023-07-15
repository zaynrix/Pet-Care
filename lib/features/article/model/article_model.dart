part of article_module;
class ArticleModel{
  ArticleModel({
    required this.description,
    required this.createdAt,
    required this.title,
    required this.id,
    required this.content,
    required this.updatedAt,
    required this.isPublished,
    required this.petCategoryId,
    required this.userId
});
  final String id;
  final String title;
  final String content;
  final String description;
  final bool isPublished;
  final int userId;
  final int petCategoryId;
  final String createdAt;
  final String updatedAt;
}