import 'package:taskmanagement/core/path/path.dart';

class GetProfileData extends ChangeNotifier {
  UserProfileModel userProfileModel = UserProfileModel();
  File? image;
  Future<void> getUseProfileData() async {
    SharedPreferences sharedpre = await SharedPreferences.getInstance();
    final token = sharedpre.getString(Keys.userToken);
    if (token != null) {
      final response = await ApiCalls.RequestGet(
        uri: Urls.ProfileDetailsUrl(),
        token: token,
      );

      if (response.statusCode == 200) {
        final deCodeData = jsonDecode(response.body);
        final data = deCodeData["data"][0];

        userProfileModel = UserProfileModel.fromJson(data);
        getImgDB();
        notifyListeners();
      }
    }
  }

  void getImgDB() async {
    SharedPreferences sharedpre = await SharedPreferences.getInstance();

    final img = sharedpre.getString(Keys.imgKey);

    if (img != null && File(img).existsSync()) {
      image = File(img);
      notifyListeners();
    }
  }
}
