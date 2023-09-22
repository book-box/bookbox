import 'package:flutter/material.dart';

import 'package:bookbox/lista.dart';
import 'package:bookbox/botoes_perfil.dart';
import 'package:bookbox/personal_info.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Logo.png'),
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Head.png'),
                color: Colors.white,
              ),
              label: 'Head',
            ),
          ],
        ),
        body: const Column(
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
            SizedBox(height: 20),
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
