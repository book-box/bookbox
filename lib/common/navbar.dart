import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
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
}
