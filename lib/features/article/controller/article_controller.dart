part of article_module;

class ArticleController extends ChangeNotifier{
  final ArticleRepo articleRepo = sl<ArticleRepo>();
  List<ArticleModel> articles = [];
  bool isLoading = false;

  Future<dynamic> getArticles() async {
    isLoading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () async{
      articles = await articleRepo.getArticleRepo();
      isLoading = false;
      notifyListeners();
    });

  }
}