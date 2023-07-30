part of pets_module;

class EditPetInfo extends StatelessWidget {
  const EditPetInfo({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: AppSize.s40.marginBottom,
        child: ElevatedButton(
          onPressed: (){},
          child: const Text("Save"),
        ),
      ),
      appBar: AppBar(
        title: const Text("Edit pet info"),
      ),
      body: Padding(
        padding: AppSize.s24.paddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AppSize.s16.addVerticalSpace,
            SizedBox(
              height: AppSize.s128.height,
              width: AppSize.s120.width,
              child: Stack(
                children: [
                  // Container(
                  //   height: AppSize.s90.height,
                  //   width: AppSize.s128.width,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle
                  //   ),
                  //   child: Image.asset(ImageAssets.dog,
                  //   fit: BoxFit.contain,),
                  // ),
                 const CircleAvatar(
                    backgroundImage: AssetImage(ImageAssets.dog),
                    radius: 60,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: ColorManager.transparent,
                      radius: AppSize.s20,
                      child: CircleAvatar(
                        backgroundColor: ColorManager.white,
                        child: SvgPicture.asset(IconAssets.plus),
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppSize.s28.addVerticalSpace,
            CustomTextFormField(hintText: "Name", validator: (value) => value!.validateUserName()),
            AppSize.s20.addVerticalSpace,
            EditPetInfoCard(title: "Age", hint: '4 Years, 2 Months', sheetPage: ( context) => const EditAgeSheet(),),
            AppSize.s20.addVerticalSpace,
            EditPetInfoCard(title: "Species", hint: 'Dog', sheetPage: ( context) => const EditSpeciesPetSheet(),),
            AppSize.s20.addVerticalSpace,
            CustomTextFormField(hintText: "Breed", validator: (value) => value!.validateUserName()),
            AppSize.s20.addVerticalSpace,
            EditPetInfoCard(title: "Gender", hint: 'Male', sheetPage: ( context) => const EditGenderPetSheet(),),
          ],
        ),
      ),
    );
  }
}
