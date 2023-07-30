part of pets_module;

class EditPetInfoCard extends StatelessWidget {
  const EditPetInfoCard({
    required this.title,
    required this.hint,
    required this.sheetPage,
    Key? key,
  }) : super(key: key);

  final String hint;
  final String title;

  final Widget Function(BuildContext) sheetPage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35)),
        ),
        context: context,
        builder: sheetPage,),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s24.width, vertical: AppSize.s9.height),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: AppSize.s16.circularRadius,
            boxShadow: [customShadow()]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: captionRegular,
                ),
                Text(
                  hint,
                  style: bodyMedium,
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios , color: ColorManager.primary, size: AppSize.s20,)
          ],
        ),
      ),
    );
  }
}
