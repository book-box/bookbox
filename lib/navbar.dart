import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';

class Navbar extends BottomNavigationBarItem {

  Navbar({Key? key}) : super(key: key);

  final List<BottomNavigationBarItemInfo> bottomNavItems = [
    BottomNavigationBarItemInfo(
      icon: null,
      iconPath: "images/search.png",
      onPressed: () {
        // Ação ao pressionar o ícone de pesquisa
      },
    ),
    BottomNavigationBarItemInfo(
      icon: null,
      iconPath: "images/meio.png",
      onPressed: () {
        // Ação ao pressionar o segundo ícone
      },
    ),
    BottomNavigationBarItemInfo(
      icon: null,
      iconPath: "images/head.png",
      onPressed: () {
        // Ação ao pressionar o ícone de configurações
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {

  }
}
