import 'package:flutter/material.dart';
import 'package:bookbox/perfil/seguidores.dart';

import 'package:bookbox/perfil/services/profile_service.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

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
                child: const Text('HS'),
              ),
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
