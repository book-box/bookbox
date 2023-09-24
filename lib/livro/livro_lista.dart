import 'package:flutter/material.dart';

class LivroLista extends StatelessWidget {
  const LivroLista(this.nota, {Key? key}) : super(key: key);

  final String nota;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 90,
      height: 135,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}