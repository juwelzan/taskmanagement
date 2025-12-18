class UdateProfileModel {
  final String lastName, firstName, photo;

  UdateProfileModel({
    required this.lastName,
    required this.firstName,
    required this.photo,
  });

  Map<String, String> toJson() {
    return {"firstName": firstName, "lastName": lastName, "photo": photo};
  }
}
