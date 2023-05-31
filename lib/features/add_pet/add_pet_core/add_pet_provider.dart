import 'package:flutter/cupertino.dart';
import 'package:pet_care/features/add_pet/add_pet_model/add_pet_model.dart';
import 'package:pet_care/features/add_pet/add_pet_model/pet_gender_model.dart';

class AppPetProvider extends ChangeNotifier {
  final PageController controller = PageController();
  int activeIndex = 0;
  int currantPage = 0;
  final List<AddPetModel> types = AddPetModel.petSpecies;
  final List<PetGenderModel> genders = PetGenderModel.genderType;


  void initStateAddPet() {
    controller.addListener(() {
      activeIndex = controller.page!.round();
      notifyListeners();
    });
  }

  onPageChange(int value) {
    currantPage = value;
    notifyListeners();
  }

  selectPetType({required String type}) {
    for (var item in types) {
      item.isSelect = false;
    }
    final index = types.indexWhere((element) => element.name == type);
    types[index].isSelect = true;
    notifyListeners();
  }

  selectPetGender({required String type}) {
    for (var item in genders) {
      item.isSelect = false;
    }
    final index = genders.indexWhere((element) => element.type == type);
    genders[index].isSelect = true;
    notifyListeners();
  }

}