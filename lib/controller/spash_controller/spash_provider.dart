// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:taskmanagement/core/path/path.dart';

class SpashProvider extends ChangeNotifier {
  GetProfileData getProfileData;
  final TaskDataController taskDataController;
  SpashProvider(this.taskDataController, this.getProfileData);
  void SplashEnd() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final key = sharedPreferences.getString(Keys.userToken);
    print("object splash end");
    await Future.delayed(Duration(seconds: 3));
    if (key != null) {
      print("key ase");
      taskDataController.getTaskData();
      getProfileData.getUseProfileData();
      router.go("/home");
    } else {
      router.go("/login");
      notifyListeners();
    }
  }
}
