import 'package:taskmanagement/core/models/task_data_model/task_data_model.dart';

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
