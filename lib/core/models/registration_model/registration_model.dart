class RegistrationModel {
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String password;

  RegistrationModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.password,
  });
  Map<String, String> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
    };
  }
}
