import 'package:taskmanagement/core/path/path.dart';

class OtpSendEmail extends ChangeNotifier {
  String emailError = "";
  bool isLoding = false;
  Future<void> emailOPTSend(String email) async {
    emailError = "";
    await lodig(true);

    final response = await ApiCalls.RequestGet(uri: Urls.EmaiOTPSendUrl(email));
    notifyListeners();

    if (response.statusCode == 200) {
      router.push("/pinveri");
    }
    if (response.statusCode == 404) {
      final decode = jsonDecode(response.body);
      emailError = decode["data"];
      await lodig(false);
      notifyListeners();
    }
  }

  Future<void> lodig(bool v) async {
    isLoding = v;

    notifyListeners();
  }
}
