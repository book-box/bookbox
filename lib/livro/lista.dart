import 'package:flutter/material.dart';
import 'package:bookbox/livro/livro_lista.dart';

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
                color: Color.fromARGB(255, 213, 213, 213),
              ),
            ),
        ),
        const SizedBox(height: 10),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LivroLista('assets/imagens/1.jpg'),
              LivroLista('assets/imagens/1.jpg'),
              LivroLista('assets/imagens/1.jpg'),
              LivroLista('assets/imagens/1.jpg'),
              LivroLista('assets/imagens/1.jpg'),
            ],
          ),
        ),
      ],
    );
  }
}