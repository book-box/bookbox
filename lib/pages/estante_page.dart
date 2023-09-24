import 'package:flutter/material.dart';
import 'package:bookbox/estante/estante.dart';

class EstantePage extends StatelessWidget {
  const EstantePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      bottomNavigationBar: Estante(),
      body: Estante(),
    );
  }
}