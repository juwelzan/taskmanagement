import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
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

      await prefs.setString(ApiRequestState.imgKey, savedImage.path);
      router.pop();
    } catch (e) {
      debugPrint('Image pick error: $e');
    }
  }
}
