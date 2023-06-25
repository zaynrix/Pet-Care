part of shop_widgets;

class DividerShopCard extends StatelessWidget {
   DividerShopCard({
     required this.title,
     required this.onPressed,
     required this.textButton,
    Key? key,
  }) : super(key: key);
  final SizeConfig sizeConfig = sl<SizeConfig>();
  final String title;
  final String textButton;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.getScreenWidth(AppSize.s24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            title,
            style: titleSemiBoldPrimary,
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                textButton,
                style: footNoteRegular(color: ColorManager.gray),
              ))
        ],
      ),
    );
  }
}
