import 'package:taskmanagement/core/models/login_model/login_model.dart';
import 'package:taskmanagement/core/path/path.dart';

class UserLoginController extends ChangeNotifier {
  Future<void> userlogin(String email, String password) async {
    SharedPreferences sharedpre = await SharedPreferences.getInstance();

    LoginModel body = LoginModel(email: email, password: password);
    final response = await ApiCalls.RequestPost(
      uri: Urls.LoginUrl(),
      body: body.toJson(),
    );

    if (response.statusCode == 200) {
      final decodeBody = jsonDecode(response.body);
      final token = decodeBody["token"];

      sharedpre.setString(Keys.userToken, token);

      router.go("/home");
    }

    if (response.statusCode == 404) {
      // NotFountModel.fromJson(jsonDecode(response.body))
    }
  }
}
