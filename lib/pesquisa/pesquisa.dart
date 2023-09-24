import 'package:flutter/material.dart';

class Pesquisa extends StatelessWidget {
  const Pesquisa({super.key});

  @override
  Widget build(context) {
    return const Center(
      child: Text(
        'Pesquisa',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 60,
        ),
      ),
    );
  }
}
