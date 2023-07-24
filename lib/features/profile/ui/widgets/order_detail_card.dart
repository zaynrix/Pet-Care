part of profile_module;

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.price,
  }) : super(key: key);

  final String title;
  final String imagePath;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSize.s16.marginBottom,
      height: 104.height,
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: ColorManager.primaryWithTransparent10))),
      child: Padding(
        padding: AppSize.s24.paddingBottom,
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: AppSize.s80.width,
              height: AppSize.s80.height,
            ),
            AppSize.s16.addHorizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: footNoteRegular(color: ColorManager.primary),
                  ),
                  const Spacer(),
                  FittedBox(
                    child: Text(
                      "\$$price",
                      style: bodyBoldPrimary,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
