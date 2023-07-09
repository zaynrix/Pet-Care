part of location_module;

class LocationController extends GetxController {
  double latitude = 37.42796133580664;

  double longitude = -122.085749655962;

  static const LatLng latLng = LatLng(37.42796133580664, -122.085749655962);

  CameraPosition initialCameraPosition =
      const CameraPosition(target: latLng, zoom: 15);

  Set<Marker> markers = {};

  late GoogleMapController googleMapController;


  @override
  void onReady() async {
    super.onReady();
    debugPrint("This is inside init \n ************* ");
    Position position = await determinePosition();
    debugPrint("This is position: \n ${position.altitude} ************* ");
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 18)));
    determinePosition();
    update();

  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
