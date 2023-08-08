part of article_module;

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
  });
  final String title;
  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: AppSize.s20.marginVertical,
        padding: AppPadding.p24.paddingAll,
        decoration: BoxDecoration(
            color: ColorManager.white, borderRadius: AppSize.s16.circularRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: bodyBoldPrimary,
            ),
            AppSize.s16.addVerticalSpace,
            SizedBox(
              // height: 80.height,
              child: Text(
                description,
                style: bodyRegular(color: ColorManager.gray),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            AppSize.s16.addVerticalSpace,
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 40.height,
                width: AppSize.s120.width,
                child: ElevatedButton(
                  onPressed: () {
                    RouteService.serviceNavi.pushNamedWidget(RouteGenerator.findVet);
                  },
                  child: Text(
                    AppStrings.findVets,
                    style: footNoteRegular(color: ColorManager.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
