part of article_module;

class FindArticle extends StatelessWidget {
  const FindArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.typeYourProblems),
      ),
      body: Padding(
        padding: AppPadding.p24.paddingHorizontal,
        child: Column(
          children: [
            CustomTextFormField(
            onChange: (val) {
      },
          suffixIcon:
          Icons.search,
          hintText: AppStrings.typeProblems,
          validator: (value) {
            return null;
          },
          keyBoardType: TextInputType.emailAddress),
           const ArticleCard()
          ],
        ),
      ),
    );
  }
}

