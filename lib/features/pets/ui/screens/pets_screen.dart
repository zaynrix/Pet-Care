part of pets_module;

class PetsScreen extends StatefulWidget {
   const PetsScreen({Key? key}) : super(key: key);

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  final petsController =
      Get.put(PetsController(petRepo: sl<PetRepo>()), permanent: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p24.width, vertical: AppSize.s18.height),
        margin: AppSize.s24.marginAll,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: AppSize.s16.circularRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Type problems...",
              style: bodyRegular(color: ColorManager.secondGray),
            ),
            SvgPicture.asset(IconAssets.search)
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("My Pets"),
        actions: [
          CustomIconButton(onTap: () {RouteService.serviceNavi.pushNamedWidget(RouteGenerator.mainAddPetScreen);},
              iconPath: IconAssets.plus),
          AppSize.s30.addHorizontalSpace,
        ],
      ),
      body: Column(
        children: [
          AppSize.s20.addVerticalSpace,
          GetBuilder<PetsController>(
            builder: (PetsController controller) {
             return Expanded(
                child:
                PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller.pageController,
                    itemCount: controller.pets.length,
                    itemBuilder: (context, index) {
                      final pet = controller.pets[index];
                      return AnimatedBuilder(
                        animation: controller.pageController!,
                        builder: (context, child) {
                          double value = 1.0;
                          if (controller
                              .pageController!.position.haveDimensions) {
                            value = controller.pageController!.page! - index;
                            value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                          }
                          return Transform.scale(
                            scale: Curves.easeInOut.transform(value),
                            child: child,
                          );
                        },
                        child: PetCard(name: pet.name,
                          age: pet.age.toString(),
                          imageUrl: pet.photoUrl,),
                      );
                    }
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
