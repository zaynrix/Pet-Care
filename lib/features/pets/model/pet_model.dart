part of pets_module;
class PetModel{

PetModel({
  required this.type,
  required this.name,
  required this.gender,
  required this.age,
  required this.breed,
  required this.isNature,
  required this.photoUrl
});
  final String name;
  final int age;
  final String breed;
  final bool isNature;
  final String type;
  final String gender;
  final String photoUrl;

  factory PetModel.formJson(Map<String, dynamic> json) => PetModel(
      type: json["type"],
      name: json["name"],
      gender: json["gender"],
      age: json["age"],
      breed: json["breed"],
      isNature: json["isNature"],
      photoUrl: json["photoUrl"]);
}