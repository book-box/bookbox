import 'package:bookbox/autor/autor.dart';
import 'package:flutter/material.dart';
import 'package:bookbox/common/navbar.dart';

import 'package:bookbox/pages/autor_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BookBox',
      home: Scaffold(
        body: AutorPage(),
      ),
    );
  }
}