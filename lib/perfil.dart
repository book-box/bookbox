import 'package:flutter/material.dart';

import 'package:bookbox/lista.dart';
import 'package:bookbox/botoes_perfil.dart';
import 'package:bookbox/personal_info.dart';
import 'package:bookbox/navbar.dart';


class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perfil',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        bottomNavigationBar: Navbar(),
        body: SingleChildScrollView(
          child: Column(
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
              SizedBox(height: 5),
              Divider(color: Color.fromARGB(255, 77, 75, 75),),
              SizedBox(height: 10),
              Lista('Favoritos'),
              SizedBox(height: 10),
              BotoesPerfil(),
              SizedBox(height: 10),
              Lista('Lista 1'),
              Lista('Lista 2'),
            ],
          ),
        ),
      ),
    );
  }
}
