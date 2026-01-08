import 'package:taskmanagement/core/path/path.dart';

class DeleteTaskController extends ChangeNotifier {
  TaskDataController taskDataController;
  DeleteTaskController(this.taskDataController);

  Future<void> deleteTask(String taskId) async {
    print("objectewifhusd");
    SharedPreferences userData = await SharedPreferences.getInstance();
    final token = userData.getString(Keys.userToken);
    final response = await ApiCalls.RequestGet(
      uri: Urls.DeleteTaskUrl(taskId),
      token: token,
    );

    if (response.statusCode == 200) {
      taskDataController.getTaskData();
    }
  }
}
