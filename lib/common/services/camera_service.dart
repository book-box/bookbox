import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class CameraService {
  static Future<File?> saveImage(File image) async {
    File newImage;

    try {
      Directory? dir = await getExternalStorageDirectory();
      newImage = await image.copy(path.join(dir!.path ,path.basename(image.path)));
    } catch (e) {
      return null;
    }

    return newImage;
  }

  static Future<File?> pickImageFromGallery() async {
    XFile? f = await ImagePicker().pickImage(source: ImageSource.gallery);
    File? res = f != null ? File(f.path) : null; 
    return res;
  }

  static Future<File?> pickImageFromCamera() async {
    XFile? f = await ImagePicker().pickImage(source: ImageSource.camera);
    File? res = f != null ? File(f.path) : null; 
    return res;
  }
}