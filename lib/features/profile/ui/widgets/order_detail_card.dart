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
      padding: AppSize.s24.paddingBottom,
      margin: AppSize.s16.marginBottom  ,
      height: 104.height,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color:
                  ColorManager.primaryWithTransparent10))),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: AppSize.s80.width,
            height: AppSize.s80.height,
          ),
          AppSize.s16.addHorizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppSize.s166,
                child: Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: footNoteRegular(
                      color: ColorManager.primary),
                ),
              ),
              const Spacer(),
              Text(
                "\$$price",
                style: bodyBoldPrimary,
              )
            ],
          )
        ],
      ),
    );
  }
}
