import 'package:flutter/material.dart';

class BottomNavigationBarItemInfo {
  final Icon? icon;
  final String? iconPath;
  final Function() onPressed;

  BottomNavigationBarItemInfo({
    required this.icon,
    required this.iconPath,
    required this.onPressed,
  });
}