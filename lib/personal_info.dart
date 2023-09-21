import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.4),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.brown.shade800,
            child: const Text('AH'),
          ),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Text.rich(
            TextSpan(text: '“ E você, meu amigo '),
          ),
        ),
      ],
    );
  }
}
