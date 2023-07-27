import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/features/home/models/pets_model.dart';
import 'package:pet_care/features/home/models/vets_model.dart';
import 'package:pet_care/features/home/repositories/home_repo.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/routing/routing_module.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  PetsModel? petsModel;
  VetsModel? vetsModel;
  Vets? singleVet;

  int selectedScreen = 0;

  void onItemTapped(int index) {
    selectedScreen = index;
    notifyListeners();
  }

  Future<void> getPetsProvider() async {
    isLoading = true;
    try {
      PetsModel res = await sl<HomeRepository>().getPetsRepo();
      print("get data");
      petsModel = res;
    } on DioException catch (e) {
      debugPrint("$e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getVetsProvider() async {
    isLoading = true;
    try {
      VetsModel res = await sl<HomeRepository>().getVetsRepo();
      vetsModel = res;
      print("${vetsModel!.vets!.length ?? "sss"}");
      notifyListeners();
    } on DioException catch (e) {
      debugPrint("$e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectPet(int index) {
    // Update the selected status of the pet at the given index
    if (petsModel != null) {
      petsModel!.pets![index].selected = true;

      // Deselect all other pets
      for (int i = 0; i < petsModel!.pets!.length; i++) {
        if (i != index) {
          petsModel!.pets![i].selected = false;
        }
      }

      // Notify listeners that the data has changed
      notifyListeners();
    }
  }

  void setVetObject({Vets? current}) {
    print("${current!.name}");
    isLoading = true;
    notifyListeners();
    singleVet = current;
    isLoading = false;
    notifyListeners();

    RouteService.serviceNavi.pushNamedWidget(
      RouteGenerator.productDetailsScreen,
    );
  }
}
