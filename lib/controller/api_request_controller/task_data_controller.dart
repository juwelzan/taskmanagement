// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanagement/apps/api/api_call/api_calls.dart';
import 'package:taskmanagement/apps/api/url/urls.dart';
import 'package:taskmanagement/core/key/key.dart';
import 'package:taskmanagement/core/models/task_data_model/task_data_model.dart';
import 'package:taskmanagement/core/models/task_model/task_mode.dart';
import 'package:taskmanagement/core/path/path.dart';

class TaskDataController extends ChangeNotifier {
  List<TaskDataModel> newTaskAll = <TaskDataModel>[];
  List<TaskDataModel> completedTaskAll = <TaskDataModel>[];
  List<TaskDataModel> canceledTaskAll = <TaskDataModel>[];
  List<TaskDataModel> progressTaskAll = <TaskDataModel>[];

  Future<void> getTaskData() async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    final token = userData.getString(Keys.userToken);

    try {
      final newTask = await ApiCalls.RequestGet(
        uri: Urls.NewTaskGetUrl(),
        token: token,
      );
      final completedTask = await ApiCalls.RequestGet(
        uri: Urls.CompletedTaskGetUrl(),
        token: token,
      );
      final canceledTask = await ApiCalls.RequestGet(
        uri: Urls.CanceledTaskGetUrl(),
        token: token,
      );
      final progressTask = await ApiCalls.RequestGet(
        uri: Urls.ProgressTaskGetUrl(),
        token: token,
      );
      print("object121212");
      if (newTask.statusCode == 200 &&
          completedTask.statusCode == 200 &&
          canceledTask.statusCode == 200 &&
          progressTask.statusCode == 200) {
        TaskMode newTaskData = TaskMode.formJson(jsonDecode(newTask.body));
        TaskMode completedTaskData = TaskMode.formJson(
          jsonDecode(completedTask.body),
        );
        TaskMode canceledTaskData = TaskMode.formJson(
          jsonDecode(canceledTask.body),
        );
        TaskMode progressTaskData = TaskMode.formJson(
          jsonDecode(progressTask.body),
        );
        newTaskAll = newTaskData.taskData;
        completedTaskAll = completedTaskData.taskData;
        canceledTaskAll = canceledTaskData.taskData;
        progressTaskAll = progressTaskData.taskData;

        print(completedTaskAll.length);
        notifyListeners();
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
