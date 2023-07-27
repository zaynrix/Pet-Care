class UserModel {
  UserModel._(
      {required this.email,
      required this.id,
      required this.name,
      required this.isDeleted,
      required this.isVerified,
      required this.phoneNumber});

  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final bool isVerified;
  final bool isDeleted;

  factory UserModel.fakeData() => UserModel._(
      email: "",
      id: 000000000,
      name: "",
      isDeleted: false,
      isVerified: false,
      phoneNumber: "");

factory UserModel.fromJson(Map<String, dynamic> json) =>UserModel._(
    email: json["email"],
    id: json["id"],
    name: json["name"],
    isDeleted: json["isDeleted"],
    isVerified: json["isVerified"],
    phoneNumber: json["phoneNumber"]);

Map<String , dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["id"] = id;
  data["name"] = name;
  data["email"] = email;
  data["isVerified"] = isVerified;
  data["phoneNumber"] = phoneNumber;
  data["isDeleted"] = isDeleted;
  return data;
}
}
