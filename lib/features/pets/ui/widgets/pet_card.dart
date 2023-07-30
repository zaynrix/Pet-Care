part of pets_module;

class PetCard extends StatelessWidget {
  const PetCard({
    required this.name,
    required this.age,
    required this.imageUrl,
    super.key,
  });

  final String name;
  final String age;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s24),
          topRight: Radius.circular(AppSize.s24)),
      child: Container(
        decoration: const BoxDecoration(
            color: ColorManager.tertiary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSize.s20),
              topLeft: Radius.circular(AppSize.s20),
            )),
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: Get.width,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => SizedBox(
                width: Get.width,
                child: const Center(
                  child: Icon(Icons.new_releases),
                ),
              ),
            ),
            Padding(
              padding: AppPadding.p32.paddingAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: h1Bold.copyWith(color: ColorManager.white),
                      ),
                      CustomIconButton(
                          onTap: () {
                            RouteService.serviceNavi
                                .pushNamedWidget(RouteGenerator.editPetInfo);
                          },
                          iconPath: IconAssets.edit)
                    ],
                  ),
                  Text(
                    "$age years",
                    style: h3Medium.copyWith(color: ColorManager.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
