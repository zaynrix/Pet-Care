part of article_module;

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({
    required this.article,
    Key? key}) : super(key: key);
  final ArticleModel article;
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

          Padding(
            padding: AppPadding.p24.paddingHorizontal,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: Get.width * 0.6,
                      child: Text(
                        article.title,
                        style: h3Bold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  AppSize.s24.addVerticalSpace,
                  ClipRRect(
                      borderRadius: AppSize.s8.circularRadius,
                      child: Image.asset(
                        ImageAssets.articleImage,
                        fit: BoxFit.cover,
                      )),
                  AppSize.s30.addVerticalSpace,
                  const Text(
                    "Overview",
                    style: titleBold,
                  ),
                  AppSize.s20.addVerticalSpace,
                  Text(
                      article.description , style: bodyRegular(color: ColorManager.primary),
                  maxLines: 3, overflow: TextOverflow.ellipsis,),
                  AppSize.s20.addVerticalSpace,
                  const Text(
                    "Start:",
                    style: titleBold,
                  ),
                  AppSize.s20.addVerticalSpace,
                  Text(
                    article.content , style: bodyRegular(color: ColorManager.primary),
                    maxLines: 3, overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     width: 375.width,
          //     height: 200.height,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: const Alignment(0.00, -1.00),
          //         end: const Alignment(0, 1),
          //         colors: [Colors.white.withOpacity(0), Colors.white],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
