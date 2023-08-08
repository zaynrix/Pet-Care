class VetsModel {
  List<Vets>? vets;

  VetsModel({this.vets});

  VetsModel.fromJson(Map<String, dynamic> json) {
    if (json['vets'] != null) {
      vets = <Vets>[];
      json['vets'].forEach((v) {
        vets!.add(Vets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vets != null) {
      data['vets'] = vets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vets {
  String? name;
  int? id;
  int? review;
  String? image;

  Vets({this.name, this.id, this.review, this.image});

  Vets.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    review = json['review'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['review'] = review;
    data['image'] = image;
    return data;
  }
}
