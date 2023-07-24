part of add_shop_module;

class AppOldPetScreen extends StatelessWidget implements PageWidget{
  AppOldPetScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = sl<SizeConfig>();
  @override
  void onPressedFunction() {
    debugPrint('Page AppOldPetScreen action');
    // Add your custom functionality for Page 1 here
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add old");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("How old is your pet?" ,style: h3Bold,),
          const RVerticalSpace(height: AppSize.s25),
          const GradientCircleLine(),
          const RVerticalSpace(height: AppSize.s16),
          SizedBox(
            height: sizeConfig.getScreenHeight(AppSize.s48),
            child: WheelChooser.integer(
              onValueChanged: (s) {

              },
              maxValue: 99,
              minValue: 1,
              initValue: 2,
              horizontal: true,
              itemSize: 70,
              selectTextStyle: h3Bold,
              unSelectTextStyle: h3BoldWithOpacity
            ),
          ),
          const RVerticalSpace(height: AppSize.s5),
          Text("years",style: bodyRegular(color: ColorManager.primary)),
          const RVerticalSpace(height: AppSize.s16),
          const GradientCircleLine(),
          const RVerticalSpace(height: AppSize.s16),
          SizedBox(
            height: sizeConfig.getScreenHeight(AppSize.s48),
            child: WheelChooser.integer(
              onValueChanged: (s) {},
              maxValue: 12,
              minValue: 1,
              initValue: 8,
              horizontal: true,
              itemSize: 70,
                selectTextStyle: h3Bold,
                unSelectTextStyle:h3BoldWithOpacity,
            ),
          ),
          const RVerticalSpace(height: AppSize.s5),
          const Text("months",style: TextStyle(fontSize: 15),),
          const RVerticalSpace(height: AppSize.s16),
          const GradientCircleLine(),
        ],
      ),
    );
  }
}
