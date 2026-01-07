import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanagement/core/path/path.dart';

class LogoutController extends ChangeNotifier {
  Future<void> logoutUser() async {
    SharedPreferences userDara = await SharedPreferences.getInstance();
    userDara.clear();
    router.go("/login");
  }
}
