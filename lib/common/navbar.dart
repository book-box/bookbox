import 'package:flutter/material.dart';
import 'package:bookbox/pages/home_page.dart';
import 'package:bookbox/pages/perfil_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  _Navbar createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int index = 1;
  final pages = [
    Container(
      color: Colors.black,
      child: const Center(
        child: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    ),
    const HomePage(),
    const PerfilPage(),
  ];
  final topbar = [
    null,
    AppBar(
        backgroundColor: Colors.black,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'BOOKBOX',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        )),
    null
  ];

  @override
  Widget build(context) => BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/pesquisa');
            }
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/');
            }
            if (index == 2) {
              Navigator.pushReplacementNamed(context, '/perfil');
            }
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 40,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Logo.png',
                width: 30,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Head.png'),
                color: Colors.white,
                size: 40,
              ),
              label: 'Head',
            ),
          ],
      );
}
