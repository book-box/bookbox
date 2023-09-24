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
  Widget build(context) => Scaffold(
        backgroundColor: Colors.black,
        body: pages[index],
        appBar: topbar[index],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.black,
          selectedIndex: index,
          destinations: [
            const NavigationDestination(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 40,
              ),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/images/Logo.png',
                width: 30,
              ),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: ImageIcon(
                AssetImage('assets/images/Head.png'),
                color: Colors.white,
                size: 40,
              ),
              label: 'Head',
            ),
          ],
          onDestinationSelected: (index) => setState(() => this.index = index),
        ),
      );
}
