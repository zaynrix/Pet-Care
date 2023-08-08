part of vets_module;

class VetCard extends StatelessWidget {
  const VetCard({
    required this.vet,
    super.key,
  });

  final MainVetsModel vet;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSize.s16.marginBottom,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: AppSize.s16.circularRadius,
          boxShadow: [customShadow()]),
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.s24.width, vertical: 17.height),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
            CachedNetworkImageProvider(
                vet.image
            ),
          ),
          AppSize.s18.addHorizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(vet.name, style: bodyBoldPrimary,),
              AppSize.s5.addVerticalSpace,
              Text("Veterinary" , style: footNoteRegular(color: ColorManager.gray),),
              AppSize.s8.addHorizontalSpace,
              Row(
                children: [
                  RatingStars(rating: vet.rating,),
                  AppSize.s8.addHorizontalSpace,
                  Text(vet.countRating.toString() , style: footNoteRegular(color: ColorManager.gray))
                ],
              ),
              AppSize.s16.addVerticalSpace,
              SizedBox(
                  width: 184.width,
                  height: 35.height,
                  child: ElevatedButton(onPressed: (){},
                      child: Text("Start consult | \$${vet.price}", style: footNoteRegular(color: ColorManager.white),)))
            ],
          )
        ],
      ),
    );
  }
}
