part of vets_module;
class VetsController extends GetxController{
 VetsController({required this.repo});
  final VetsRepo repo ;
  List<MainVetsModel> vets = [];
  bool isLoading = false;

  Future<dynamic> getVets() async {
    try{
      isLoading = true;
      update();
      Future.delayed(const Duration(seconds: 2), () async {
        vets = await repo.getVetsRepo();
        isLoading = false;
        update();
      }) ;
  } catch (e) {
      isLoading = false;
      debugPrint("This is inside catch $e");
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