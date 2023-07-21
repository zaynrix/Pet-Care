part of pets_module;

class PetsScreen extends StatelessWidget {
  const PetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Pets"),
        actions: [
          CustomIconButton(onTap: (){}, iconPath: IconAssets.plus),
          AppSize.s30.addHorizontalSpace,
        ],
      ),
      body: Column(
        children: [
          AppSize.s20.addVerticalSpace,
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: ColorManager.tertiary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppSize.s20),
                  topLeft: Radius.circular(AppSize.s20),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
