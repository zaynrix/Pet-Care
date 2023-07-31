part of article_module;

class FindArticle extends StatefulWidget {
  const FindArticle({Key? key}) : super(key: key);

  @override
  State<FindArticle> createState() => _FindArticleState();
}

class _FindArticleState extends State<FindArticle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sl<ArticleController>().getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.typeYourProblems),
      ),
      body: Consumer<ArticleController>(
        builder: (context, controller, child) => Padding(
          padding: AppPadding.p24.paddingHorizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                    onChange: (val) {},
                    suffixIcon: Icons.search,
                    hintText: AppStrings.typeProblems,
                    validator: (value) {
                      return null;
                    },
                    keyBoardType: TextInputType.emailAddress),
                controller.isLoading == true
                    ? const LoadingStatusWidget(
                        loadingStatus: LoadingStatusOption.loading,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.articles.length,
                        itemBuilder: (context, index) => const ArticleCard()),
                // const ArticleCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
