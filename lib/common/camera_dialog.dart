import 'dart:io';

import 'package:bookbox/common/data/shared_paths.dart';
import 'package:bookbox/common/services/camera_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<File?> showCameraDialog(BuildContext context) async {
  File? res = await showDialog<File>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Select a profile photo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                CameraService.pickImageFromCamera().then(
                  (f) {
                    if (f != null) {
                      CameraService.saveImage(f).then(
                        (value) {
                          if (value != null) {
                            SharedPreferences.getInstance().then((prefs) {
                              prefs.setString(SharedPaths.createAccountImage, value.path);
                            });
                          }

                          Navigator.pop(context, value);
                        },
                      );
                    }
                  },
                );
              },
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
            ),
            ListTile(
              onTap: () {
                CameraService.pickImageFromGallery().then(
                  (f) {
                    if (f != null) {
                      SharedPreferences.getInstance().then((prefs) {
                        prefs.setString(SharedPaths.createAccountImage, f.path);
                      });
                    }

                    Navigator.pop(context, f);
                  },
                );
              },
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
      );
    },
  );

  return res;
}
