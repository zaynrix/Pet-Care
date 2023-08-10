class PetsModel {
  List<Pets>? pets;

  PetsModel({this.pets});

  PetsModel.fromJson(Map<String, dynamic> json) {
    if (json['pets'] != null) {
      pets = <Pets>[];
      json['pets'].forEach((v) {
        pets!.add(Pets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pets != null) {
      data['pets'] = pets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pets {
  String? petname;
  bool? selected;
  int? id;
  String? image;

  Pets({this.petname, this.selected, this.id, this.image});

  Pets.fromJson(Map<String, dynamic> json) {
    petname = json['petname'];
    selected = json['selected'];
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['petname'] = petname;
    data['selected'] = selected;
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
