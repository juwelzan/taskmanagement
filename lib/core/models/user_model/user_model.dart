class UserModel {
  final String token;
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String photo;
  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.photo,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["data"]["email"],
      firstName: json["data"]["firstName"],
      lastName: json["data"]["lastName"],
      mobile: json["data"]["mobile"],
      photo: json["data"]["photo"],
      token: json["token"],
    );
  }
}
