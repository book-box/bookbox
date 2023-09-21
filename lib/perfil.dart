import 'package:flutter/material.dart';

import 'package:bookbox/lista.dart';
import 'package:bookbox/botoes_perfil.dart';
import 'package:bookbox/personal_info.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perfil',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
             Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 35),
                child: IconButton(onPressed: null, icon: Icon(Icons.create)),
              ),
            ),
            PersonalInfo(),
            Lista('Favoritos'),
            BotoesPerfil(),
            Lista('Lista 1'),
            Lista('Lista 2'),
          ],
        ),
      ),
    );
  }
}
