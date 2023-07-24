part of location_module;

Widget selectLocationType(AddressProvider instance) {
  return Container(
    padding: AppSize.s24.paddingAll,
    height: Get.height * 0.4,
    decoration: BoxDecoration(
        color: ColorManager.white, borderRadius: AppSize.s16.circularRadius),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Address Type",
              style: bodyBoldPrimary,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  RouteService.serviceNavi.pop();
                },
                icon: const Icon(Icons.cancel, color: ColorManager.primary))
          ],
        ),
        Divider(
          color: ColorManager.primaryWithTransparent10,
        ),
        // AppSize.s20.addVerticalSpace,
        instance.isLoading == true
            ? const CustomCircularProgressIndicator()
            : SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: instance.addressModel!.address!.length,
                  itemBuilder: (context, index) {
                    return Expanded(
                      child: InkWell(
                        onTap: () {
                          instance.selectAddress(
                              address: instance.addressModel!.address![index]);
                          RouteService.serviceNavi.pop();
                        },
                        child: Text(
                          "${instance.addressModel!.address![index].type}",
                          style: bodyMedium,
                        ),
                      ),
                    );
                  },
                ),
              ),

        // Expanded(
        //   child: InkWell(
        //     onTap: (){
        //       RouteService.serviceNavi.pop();
        //     },
        //     child: const Text("Home" , style: bodyMedium,
        //     ),
        //   ),
        // ),
        // Expanded(
        //   child: InkWell(
        //     onTap: (){
        //       RouteService.serviceNavi.pop();
        //     },
        //     child: const Text("Other" , style: bodyMedium,
        //     ),
        //   ),
        // ),
        // AppSize.s20.addVerticalSpace,
      ],
    ),
  );
}
