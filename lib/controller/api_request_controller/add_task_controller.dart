// ignore_for_file: use_build_context_synchronously

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanagement/apps/api/api_call/api_calls.dart';
import 'package:taskmanagement/apps/api/url/urls.dart';
import 'package:taskmanagement/controller/api_request_controller/task_data_controller.dart';
import 'package:taskmanagement/controller/page_view_controller/screen_controller.dart';
import 'package:taskmanagement/core/key/key.dart';
import 'package:taskmanagement/core/models/new_task_add_model/new_task_add_model.dart';
import 'package:taskmanagement/core/path/path.dart';

class AddTaskController extends ChangeNotifier {
  Future<void> addNewTask({
    required String title,
    required String description,
    required BuildContext context,
  }) async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    final token = userData.getString(Keys.userToken);
    AddNewTaskModel body = AddNewTaskModel(
      title: title,
      description: description,
      status: "New",
    );

    final response = await ApiCalls.RequestPost(
      uri: Urls.AddNewTaskUrl(),
      body: body.toJson(),
      token: token,
    );

    if (response.statusCode == 200) {
      context.read<TaskDataController>().getTaskData();
      context.read<ScreenController>().AddNewTaskIndexUpdata();
      router.go("/home");
    }
  }
}
