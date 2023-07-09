part of location_module;

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({Key? key}) : super(key: key);

  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 15);
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          title: const Text("Add new address"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: initialCameraPosition,
                    markers: markers,
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) async {
                      googleMapController = controller;
                      String value = await DefaultAssetBundle.of(context).loadString(JsonAssets.mapStyle);
                      googleMapController.setMapStyle(value);
                    },
                  ),
                  Positioned(
                      child: Container(
                        width: Get.width * 1,
                        height: Get.height * 0.08,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: const Alignment(0, 1),
                            end: const Alignment(0.00, -1.00),
                            colors: [ ColorManager.white.withOpacity(0) , ColorManager.white ]
                          )
                        ),
                        child: Text("You can choose your location\nby dragging the map", style: bodyRegular(color: ColorManager.primary), textAlign: TextAlign.center,),
                      )
                  )
                ],
              ),
            ),
            Container(
              width: Get.width * 1,
              height: Get.height * 0.28,
              color: ColorManager.white,
              child: Column(
                children: [
                  Container(
                    padding: AppSize.s16.paddingAll,
                    width: 279.width,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: AppSize.s16.circularRadius,
                        border: Border.all(color: ColorManager.secondGray)
                    ),
                    child: Text("3212 Bridge Street,\nMaryland(MD), 20855" , style: footNoteBold,maxLines: 2, textAlign: TextAlign.center,),
                  ),
                  AppSize.s16.addVerticalSpace,
                  ElevatedButton(onPressed: (){},
                      child: const Text("Use this address")),
                  AppSize.s20.addVerticalSpace,
                  TextButton(onPressed: (){}, child: Text("Add location manually" , style: bodyRegular(color: ColorManager.secondary),)),
                  AppSize.s20.addVerticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
