import 'package:taskmanagement/core/path/path.dart';

class OtpVerifyController extends ChangeNotifier {
  Future<void> otpVerifyEvent(String email, String otp) async {
    final response = await ApiCalls.RequestGet(
      uri: Urls.OTPVerifyUrl(email, otp),
    );

    if (response.statusCode == 200) {
      router.push("/setpassword");
      emit(state.copyWith(lodingSpin: false, otp: event.otp));
    }

    if (response.statusCode == 406) {
      final deCode = jsonDecode(response.body);
      emit(state.copyWith(invalidOTP: deCode["data"], lodingSpin: false));
    }
    emit(state.copyWith(lodingSpin: false));
  }
}
