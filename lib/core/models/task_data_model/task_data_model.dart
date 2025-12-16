class TaskDataModel {
  final String id;
  final String title;
  final String description;
  final String status;
  final String createdDate;

  TaskDataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdDate,
  });

  factory TaskDataModel.fromJson(Map<String, dynamic> json) {
    return TaskDataModel(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      status: json["status"],
      createdDate: json["createdDate"],
    );
  }
}
