class AddNewTaskModel {
  final String title, description, status;
  AddNewTaskModel({
    required this.title,
    required this.description,
    this.status = "New",
  });

  Map<String, String> toJson() {
    return {"title": title, "description": description, "status": status};
  }
}
