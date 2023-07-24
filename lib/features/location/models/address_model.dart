class AddressModel {
  List<Address>? address;

  AddressModel({this.address});

  AddressModel.fromJson(Map<String, dynamic> json) {
    if (json['addresses'] != null) {
      address = <Address>[];
      json['addresses'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
  }
}

class Address {
  int? id; // New ID field
  String? type;
  String? street;
  String? houseNumber;
  String? ps;

  Address({
    this.id,
    this.type,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['address_id'];
    type = json['address_type'];
    street = json['street_address'];
    houseNumber = json['house_number'];
    ps = json['postcode'];
  }
}
