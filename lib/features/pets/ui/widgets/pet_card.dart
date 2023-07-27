part of pets_module;
class PetCard extends StatelessWidget {
  const PetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.p32.paddingAll,
      decoration: const BoxDecoration(
          color: ColorManager.tertiary,
          image: DecorationImage(image: AssetImage(ImageAssets.bigDog),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppSize.s20),
            topLeft: Radius.circular(AppSize.s20),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Chocoloko" , style: h1Bold,),
              CustomIconButton(onTap: (){}, iconPath: IconAssets.edit)
            ],
          ),
          Text("2 years old", style: h3Medium,)
        ],
      ),
    );
  }
}

