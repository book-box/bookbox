import 'package:flutter/material.dart';
import 'package:bookbox/perfil/seguidores.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.4),
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
        const Align(
          alignment: Alignment.topCenter,
          child: Text.rich(
            TextSpan(text: 'lorem ipsum dolor sit amet'),
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
