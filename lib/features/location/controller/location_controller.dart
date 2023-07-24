part of location_module;

class LocationController extends GetxController {
  double latitude = 37.42796133580664;
  double longitude = -122.085749655962;

  static const LatLng latLng = LatLng(37.42796133580664, -122.085749655962);

  CameraPosition initialCameraPosition =
      const CameraPosition(target: latLng, zoom: 14);

  Set<Marker> markers = {};

  late GoogleMapController googleMapController;
  late Position currentPosition;
  String currantAddress = "";

  // List<Placemark> placeMarks =  placemarkFromCoordinates(52.2165157, 6.9437819);

  @override
  void onReady() async {
    super.onReady();
    debugPrint("This is inside init \n ************* ");
    currentPosition = await determinePosition();
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(currentPosition.latitude, currentPosition.longitude),
            zoom: 18)));
    getAddressFromLatLng(currentPosition);
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

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placeMarks) {
      Placemark place = placeMarks[0];
      currantAddress =
          "${place.street}, ${place.subLocality}\n ${place.subAdministrativeArea}, ${place.postalCode}";
      update();
      debugPrint("This is currantAddress: :\n >>>>>> $currantAddress");
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }
}
