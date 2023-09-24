import 'package:flutter/material.dart';
import 'package:bookbox/autor/autor.dart';

class AutorPage extends StatelessWidget {
  const AutorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      body: Autor(),
    );
  }
}