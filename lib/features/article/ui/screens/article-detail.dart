part of article_module;

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: AppSize.s40.marginBottom,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Find vets"),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 375.width,
              height: 200.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, -1.00),
                  end: const Alignment(0, 1),
                  colors: [Colors.white.withOpacity(0), Colors.white],
                ),
              ),
            ),
          ),
          Padding(
            padding: AppPadding.p24.paddingHorizontal,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: Get.width * 0.6,
                      child: const Text(
                        "Top 10 signs your dogmay be sick",
                        style: h3Bold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  AppSize.s24.addVerticalSpace,

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
