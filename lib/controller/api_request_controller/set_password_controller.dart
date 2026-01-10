import 'package:taskmanagement/core/path/path.dart';

class SetPasswordController extends ChangeNotifier {
  bool lodigSpin = false;
  String? otp, email;
  Future<void> setNewPassword(String email, String otp, String password) async {
    lodig(true);
    final response = await ApiCalls.RequestPost(
      uri: Urls.ResetPasswordyUrl(),
      body: {"email": email, "OTP": otp, "password": password},
    );

    if (response.statusCode == 200) {
      lodig(false);
      router.go("/login");
    }
  }

  void lodig(bool v) {
    lodigSpin = v;
    notifyListeners();
  }

  void getEmailOTP(String gmail, String oTP) {
    print("$gmail $oTP");
    email = gmail;
    otp = oTP;
    notifyListeners();
  }
}
