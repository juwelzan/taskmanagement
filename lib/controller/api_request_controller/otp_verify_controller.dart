import 'package:taskmanagement/core/path/path.dart';

class OtpVerifyController extends ChangeNotifier {
  SetPasswordController setPasswordController;
  OtpVerifyController(this.setPasswordController);
  String? invalidOTP;
  String email = "";
  bool lodingSpin = false;

  Future<void> otpVerifyEvent(String email, String otp) async {
    invalidOTP = "";
    await lodig(true);
    notifyListeners();
    final response = await ApiCalls.RequestGet(
      uri: Urls.OTPVerifyUrl(email, otp),
    );

    if (response.statusCode == 200) {
      setPasswordController.getEmailOTP(email, otp);
      router.push("/setpassword");
    }

    if (response.statusCode == 406) {
      final deCode = jsonDecode(response.body);
      invalidOTP = deCode["data"];
      lodingSpin = false;
      notifyListeners();
    }
  }

  Future<void> lodig(bool v) async {
    lodingSpin = v;
    notifyListeners();
  }

  void fatchEmail(String gmail) {
    email = gmail;
    notifyListeners();
  }
}
