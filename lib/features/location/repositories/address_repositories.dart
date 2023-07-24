import 'dart:convert';

import 'package:pet_care/features/location/models/address_model.dart';

class AddressRepository {
  Future<AddressModel> getAddressesRepo() async {
    const String response = '''
{
  "addresses": [
    {
      "address_id": 1,
      "address_type": "home",
      "street_address": "123 Main Street",
      "house_number": "Apt 4B",
      "postcode": "12345"
    },
    {
      "address_id": 2,
      "address_type": "work",
      "street_address": "456 Business Boulevard",
      "house_number": "Suite 200",
      "postcode": "67890"
    },
    {
      "address_id": 3,
      "address_type": "others",
      "street_address": "789 Miscellaneous Lane",
      "house_number": "Bldg C",
      "postcode": "54321"
    }
  ]
}

''';

    Map<String, dynamic> jsonResponse = jsonDecode(response);
    AddressModel addressModel = AddressModel.fromJson(jsonResponse);
    return addressModel;
  }
}
