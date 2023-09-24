import 'package:flutter/material.dart';
import 'package:bookbox/autor/livro.dart';

class Lista extends StatelessWidget {
  const Lista(this.titulo, {Key? key}) : super(key: key);

  final String titulo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Livro('assets/imagens/1.jpg'),
            Livro('assets/imagens/1.jpg'),
            Livro('assets/imagens/1.jpg'),
            Livro('assets/imagens/1.jpg'),
          ],
        ),
      ],
    );
  }
}