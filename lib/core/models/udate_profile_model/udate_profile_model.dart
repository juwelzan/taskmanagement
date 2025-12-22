class UdateProfileModel {
  final String lastName, firstName;

  UdateProfileModel({required this.lastName, required this.firstName});

  Map<String, String> toJson() {
    return {"firstName": firstName, "lastName": lastName};
  }
}
