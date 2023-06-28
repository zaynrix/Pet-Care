part of notifications_module;

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.deleteFunction,
    required this.color,
    required this.title,
    required this.iconPath,
    required this.time,
    Key? key,
  }) : super(key: key);

  final String title;
  final String time;
  final String iconPath;
  final Color color;
  final Function(BuildContext p1)? deleteFunction;


  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .30,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            foregroundColor: ColorManager.error,
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.white,
          )
        ],
      ),
      child: Container(
        padding: AppPadding.p16.paddingVertical,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: ColorManager.primaryWithTransparent10))),
        child: Row(
          children: [
            Container(
              padding: AppPadding.p10.paddingAll,
              width: AppSize.s44.width,
              height: AppSize.s44.width,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color),
              child: SvgPicture.asset(iconPath),
            ),
            AppSize.s16.addHorizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: bodyRegular(color: ColorManager.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  time,
                  style: footNoteRegular(color: ColorManager.gray),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
