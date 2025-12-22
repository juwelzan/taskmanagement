// ignore_for_file: unnecessary_null_in_if_null_operators

class NotFountModel {
  final String status;
  final String useEmail;
  NotFountModel({required this.status, required this.useEmail});

  factory NotFountModel.fromJson(Map<String, dynamic> json) {
    return NotFountModel(status: json["status"], useEmail: json["data"]);
  }
}
