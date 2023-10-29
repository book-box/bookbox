import 'package:bookbox/perfil/favoritos.dart';
import 'package:flutter/material.dart';

import 'package:bookbox/perfil/lista.dart';
import 'package:bookbox/perfil/botoes_perfil.dart';
import 'package:bookbox/perfil/personal_info.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
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
          SizedBox(height: 5),
          Divider(
            color: Color.fromARGB(255, 77, 75, 75),
          ),
          SizedBox(height: 10),
          Favoritos(),
          SizedBox(height: 10),
          BotoesPerfil(),
          SizedBox(height: 10),
          Lista('Lista 1'),
          Lista('Lista 2'),
        ],
      ),
    );
  }
}
