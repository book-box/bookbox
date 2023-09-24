import 'package:flutter/material.dart';

class Livro extends StatelessWidget {
  const Livro(this.nota, {Key? key}) : super(key: key);

  final String nota;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 78,
      height: 112,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}