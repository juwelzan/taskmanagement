import 'package:taskmanagement/core/models/registration_model/registration_model.dart';
import 'package:taskmanagement/core/models/resgistration_status_model/resgistration_status_model.dart';
import 'package:taskmanagement/core/path/path.dart';

class UserRegistration extends ChangeNotifier {
  bool lodingSpin = false;
  NotFountModel emailUseMessage = NotFountModel(status: "", useEmail: "");

  void userRegistration({
    required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String password,
  }) async {
    lodig(true);
    RegistrationModel body = RegistrationModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      mobile: mobile,
      password: password,
    );
    final response = await ApiCalls.RequestPost(
      uri: Urls.RegistrationUrl(),
      body: body.toJson(),
    );
    if (response.statusCode == 200) {
      router.go("/login");
      lodig(false);
      notifyListeners();
    }

    if (response.statusCode == 400) {
      lodig(false);
      emailUseMessage = NotFountModel.fromJson(jsonDecode(response.body));
      notifyListeners();
    }
  }

  void lodig(bool value) {
    lodingSpin = value;
    emailUseMessage = NotFountModel(status: "", useEmail: "");
    print(value);
    notifyListeners();
  }
}
