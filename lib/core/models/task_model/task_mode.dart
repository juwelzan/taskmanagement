import 'package:taskmanagement/core/path/path.dart';

class TaskMode {
  final List<TaskDataModel> taskData;
  TaskMode({required this.taskData});
  factory TaskMode.formJson(Map<String, dynamic> json) {
    return TaskMode(
      taskData: (json["data"] as List)
          .map((task) => TaskDataModel.fromJson(task))
          .toList(),
    );
  }
}
