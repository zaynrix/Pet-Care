part of pets_module;

class PetsScreen extends StatelessWidget {
   PetsScreen({Key? key}) : super(key: key);

  final petController =
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
          CustomIconButton(onTap: () {}, iconPath: IconAssets.plus),
          AppSize.s30.addHorizontalSpace,
        ],
      ),
      body: Column(
        children: [
          AppSize.s20.addVerticalSpace,
          GetBuilder<PetsController>(
            builder: (PetsController controller) => Expanded(
              child:
                  PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: controller.pageController,
                    itemCount: controller.pets.length,
                      itemBuilder: (context, index) {
                      final pet = controller.pets[index];
                      return PetCard(name: pet.name,
                      age: pet.age.toString(),
                      imageUrl: pet.photoUrl,);
                      }
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
