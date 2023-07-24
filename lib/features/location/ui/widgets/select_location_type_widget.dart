part of location_module;

class SelectLocationType extends StatelessWidget {
  const SelectLocationType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSize.s24.paddingAll,
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: AppSize.s16.circularRadius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Address Type", style: bodyBoldPrimary,),
              const Spacer(),
              IconButton(onPressed: (){
                RouteService.serviceNavi.pop();
              }, icon: const Icon(Icons.cancel ,color: ColorManager.primary))
            ],
          ),
          Divider(color: ColorManager.primaryWithTransparent10,),
          AppSize.s20.addVerticalSpace,
          Expanded(
            child: InkWell(
              onTap: (){
                RouteService.serviceNavi.pop();
              },
              child: const Text("Home" , style: bodyMedium,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                RouteService.serviceNavi.pop();
              },
              child: const Text("Home" , style: bodyMedium,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                RouteService.serviceNavi.pop();
              },
              child: const Text("Other" , style: bodyMedium,
              ),
            ),
          ),
          AppSize.s20.addVerticalSpace,
        ],
      ),
    );
  }
}
