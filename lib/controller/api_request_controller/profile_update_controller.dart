import 'package:taskmanagement/core/path/path.dart';

class ProfileUpdateController extends ChangeNotifier {
  GetProfileData getProfileData;
  ProfileUpdateController(this.getProfileData);
  Future<void> profileUpdate(String fastName, String lastName) async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    final token = userData.getString(Keys.userToken);
    UdateProfileModel data = UdateProfileModel(
      lastName: lastName,
      firstName: fastName,
    );

    final response = await ApiCalls.RequestPost(
      uri: Urls.ProfileUpdateUrl(),
      body: data.toJson(),
      token: token,
    );

    if (response.statusCode == 200) {
      getProfileData.getUseProfileData();
      router.pop("/profile");
    }
  }
}
