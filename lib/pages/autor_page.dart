import 'package:flutter/material.dart';

import 'package:bookbox/autor/autor.dart';

import 'package:bookbox/common/navbar.dart';
import 'package:bookbox/common/gradient.dart';

class AutorPage extends StatelessWidget {
  const AutorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 15, 15),
      bottomNavigationBar: Navbar(),
      body: GradientBook(Autor()),
    );
  }
}