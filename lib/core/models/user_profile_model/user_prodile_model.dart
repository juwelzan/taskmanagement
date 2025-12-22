// ignore_for_file: prefer_if_null_operators

class UserProfileModel {
  final String? mobile, id, createdDate, email, firstName, lastName;

  UserProfileModel({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.id,
    this.createdDate,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json["_id"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      mobile: json["mobile"],
      createdDate: json["createdDate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "createdDate": createdDate,
    };
  }
}
