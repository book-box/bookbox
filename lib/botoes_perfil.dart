import 'package:flutter/material.dart';

class BotoesPerfil extends StatelessWidget {
  const BotoesPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: const StadiumBorder(),
          ),
          child: const Text('Estante'),
        ),
        const SizedBox(width: 30),
        ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: const StadiumBorder(),
          ),
          child: const Text('Lendo'),
        ),
        const SizedBox(width: 30),
        ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: const StadiumBorder(),
          ),
          child: const Text('Lidos'),
        ),
      ],
    );
  }
}