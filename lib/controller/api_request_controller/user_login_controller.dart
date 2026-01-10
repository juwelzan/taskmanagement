import 'package:taskmanagement/core/path/path.dart';

class UserLoginController extends ChangeNotifier {
  TaskDataController taskDataController;
  GetProfileData getProfileData;
  UserLoginController(this.taskDataController, this.getProfileData);
  bool lodingSpin = false;
  NotFountModel notFountModel = NotFountModel(status: "", useEmail: "");

  Future<void> userlogin(String email, String password) async {
    lodig(true);
    SharedPreferences sharedpre = await SharedPreferences.getInstance();
    notFountModel = NotFountModel(status: "", useEmail: "");
    notifyListeners();
    LoginModel body = LoginModel(email: email, password: password);
    final response = await ApiCalls.RequestPost(
      uri: Urls.LoginUrl(),
      body: body.toJson(),
    );

    if (response.statusCode == 200) {
      lodig(false);
      final decodeBody = jsonDecode(response.body);
      final token = decodeBody["token"];

      sharedpre.setString(Keys.userToken, token);

      router.go("/home");

      taskDataController.getTaskData();
      getProfileData.getUseProfileData();
    }

    if (response.statusCode == 404) {
      lodig(false);
      notFountModel = NotFountModel.fromJson(jsonDecode(response.body));

      notifyListeners();
    }
  }

  void lodig(bool value) {
    lodingSpin = value;
    notifyListeners();
  }
}
