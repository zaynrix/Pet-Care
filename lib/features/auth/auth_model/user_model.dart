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
      email: "test@gmail.com",
      id: 1111,
      name: "yahya",
      isDeleted: false,
      isVerified: false,
      phoneNumber: "0592487533");

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel._(
      email: json["email"] ?? "test@gmail.com",
      id: json["id"] ?? "1111",
      name: json["name"] ?? "yahya",
      isDeleted: json["isDeleted"] ?? false,
      isVerified: json["isVerified"] ?? false,
      phoneNumber: json["phoneNumber"] ?? "0592487533");

  Map<String, dynamic> toJson() {
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
