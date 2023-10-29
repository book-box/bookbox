import 'dart:io';
import 'dart:developer';

import 'package:bookbox/common/data/shared_paths.dart';
import 'package:flutter/material.dart';
import 'package:bookbox/perfil/seguidores.dart';

import 'package:bookbox/perfil/services/profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  PersonalInfoState createState() => PersonalInfoState();
}

class PersonalInfoState extends State<PersonalInfo> {
  File? _image;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      String? image = prefs.getString(SharedPaths.createAccountImage);

      if (image != null) {
        setState(() {
          _image = File(image);
        });
      }
      log('Image: $image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0.4),
              child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.brown.shade800,
                  child: (_image != null)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _image!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.person, size: 50)),
            ),
            const Seguidores(),
          ],
        ),
        const SizedBox(width: 20),
        FutureBuilder<Widget>(
          future: buildProfileWidget(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Future<Widget> buildProfileWidget() async {
    final bio = await ProfileService().getUserBio();
    return Align(
      alignment: Alignment.topCenter,
      child: Text.rich(
        TextSpan(text: bio),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }
}
