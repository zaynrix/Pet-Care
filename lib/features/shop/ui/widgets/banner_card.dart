part of shop_widgets;

class BannerCard extends StatelessWidget {
  BannerCard(
      {required this.listSvg,
      required this.controller,
      required this.onTap,
      Key? key})
      : super(key: key);

  final List listSvg;
  PageController controller;
  Function(int x) onTap;
  final SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: EdgeInsetsDirectional.only(start: sizeConfig.getScreenWidth(AppSize.s24)),
      height: sizeConfig.getScreenWidth(AppSize.s85),
      width: double.infinity,
      child: PageView.builder(
        onPageChanged: onTap,
        controller: controller,
        itemCount: listSvg.length,
        itemBuilder: (context, index) {
          return Image.asset(listSvg[index]);
        },
      ),
    );
  }
}
