// ignore_for_file: prefer_if_null_operators

class UserModel {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? photo, token;

  UserModel({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.photo,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userData = json["data"];
    return UserModel(
      email: userData["email"],
      firstName: userData["firstName"],
      lastName: userData["lastName"],
      mobile: userData["mobile"],
      photo: userData["photo"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "photo": photo,
      "token": token,
    };
  }
}

class UserDataLocalModel {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? photo, token;

  UserDataLocalModel({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.photo,
    this.token,
  });

  factory UserDataLocalModel.fromJson(Map<String, dynamic> json) {
    return UserDataLocalModel(
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      mobile: json["mobile"],
      photo: json["photo"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "photo": photo,
      "token": token,
    };
  }
}
