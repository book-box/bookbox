import 'package:flutter/material.dart';

import 'package:bookbox/lista.dart';
import 'package:bookbox/botoes_perfil.dart';
import 'package:bookbox/personal_info.dart';
import 'package:bookbox/navbar.dart';
import 'package:bookbox/seguidores.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perfil',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        bottomNavigationBar: Navbar(),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 35),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.create,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            PersonalInfo(),
            Seguidores(),
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
