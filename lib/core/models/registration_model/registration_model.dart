class RegistrationModel {
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String password;
  final String photo;

  RegistrationModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.password,
    required this.photo,
  });
  Map<String, String> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
      "photo": photo,
    };
  }
}
