import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_care/features/location/models/address_model.dart';
import 'package:pet_care/features/location/repositories/address_repositories.dart';
import 'package:pet_care/locator.dart';

class AddressProvider extends ChangeNotifier {
  bool isLoading = false;
  AddressModel? addressModel;
  Address? singleAddress;

  Future<void> getAddressProvider() async {
    debugPrint("start get Addresss");
    isLoading = true;
    try {
      AddressModel res = await sl<AddressRepository>().getAddressesRepo();
      addressModel = res;
      notifyListeners();
      debugPrint("${addressModel!.address!.length}");
    } on DioException catch (e) {
      debugPrint("$e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectAddress({Address? address}) {
    singleAddress = address;
    notifyListeners();
  }
}
