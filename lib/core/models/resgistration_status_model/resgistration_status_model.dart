// ignore_for_file: unnecessary_null_in_if_null_operators

class ResgistrationStatusModel {
  final String status;
  final String? useEmail;
  ResgistrationStatusModel({required this.status, this.useEmail});

  factory ResgistrationStatusModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"];
    return ResgistrationStatusModel(
      status: json["status"],
      useEmail: data?["email"] ?? data?["keyValue"]?["email"],
    );
  }
}
