import 'package:taskmanagement/core/path/path.dart';

class CameraImgPikController extends ChangeNotifier {
  Future<void> imagePikCamera() async {
    try {
      final picker = ImagePicker();
      final XFile? gallery = await picker.pickImage(source: ImageSource.camera);

      if (gallery == null) return;

      final directory = await getApplicationDocumentsDirectory();
      final prefs = await SharedPreferences.getInstance();

      final savedImage = File('${directory.path}/${gallery.name}');
      await File(gallery.path).copy(savedImage.path);

      await prefs.setString(Keys.imgKey, savedImage.path);
      router.pop();
    } catch (e) {
      debugPrint('Image pick error: $e');
    }
  }
}
