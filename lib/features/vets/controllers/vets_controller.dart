part of vets_module;
class VetsController extends GetxController{
  final VetsRepo repo = sl<VetsRepo>();
  List<MainVetsModel> vets = [];
  bool isLoading = false;

  Future<dynamic> getVets() async {
    try{
      isLoading = true;
      update();
      Future.delayed(const Duration(seconds: 2), () async {
        vets = await repo.getVetsRepo();
        update();
      }) ;
  } catch (e) {
      isLoading = false;
      debugPrint("$e");
      update();
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
   await getVets();
  }
}