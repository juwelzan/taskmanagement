import 'package:taskmanagement/controller/page_view_controller/screen_controller.dart';
import 'package:taskmanagement/core/models/status_select_model/status_select_model.dart';
import 'package:taskmanagement/core/path/path.dart';

class TaskStususUpdate extends ChangeNotifier {
  TaskDataController taskDataController;
  StatusSelectModel statusSelectModel = StatusSelectModel(
    color: "0xff05339C",
    StstusName: "New",
    icon: "assets/icon/checklist.png",
  );
  ScreenController screenController;
  TaskStususUpdate(this.taskDataController, this.screenController);
  String status = "";
  String selectStatus = "";
  bool isDropDownOpen = false;
  void taskStatus(String statusName) async {
    status = statusName;
    notifyListeners();
  }

  void statusDropDownOpen(bool openDropDown) async {
    isDropDownOpen = openDropDown;
    notifyListeners();
  }

  Future<void> taskstatusUpdata(String taskID, String ststusName) async {
    SharedPreferences sharedPre = await SharedPreferences.getInstance();
    final token = sharedPre.getString(Keys.userToken);
    final response = await ApiCalls.RequestGet(
      uri: Urls.UpdateTaskStatusUrl(taskID: taskID, status: ststusName),
      token: token,
    );

    if (response.statusCode == 200) {
      taskDataController.getTaskData();
      screenController.Dilog(1234982367455);
    }
  }

  void statusSelection(StatusSelectModel statusSelect) {
    statusSelectModel = statusSelect;
    notifyListeners();
  }
}
