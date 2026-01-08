import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskmanagement/core/path/path.dart';

class ImgPikGallery extends ChangeNotifier {
  Future<void> imagePikGallery() async {
    try {
      final picker = ImagePicker();
      final XFile? gallery = await picker.pickImage(
        source: ImageSource.gallery,
      );

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

  // Future<void> _saveImgDb(File image) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   Uint8List imgData = await image.readAsBytes();
  //   String imgString = base64Encode(imgData);
  //   print(imgString);
  //   prefs.setString(Keys.imgKey, imgString);
  // }
}
