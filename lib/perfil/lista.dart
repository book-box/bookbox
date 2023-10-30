import 'package:flutter/material.dart';
import 'package:bookbox/perfil/livro.dart';

class Lista extends StatelessWidget {
  const Lista(this.titulo, {Key? key}) : super(key: key);

  final String titulo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Livro('assets/images/1.jpg'),
            Livro('assets/images/1.jpg'),
            Livro('assets/images/1.jpg'),
            Livro('assets/images/1.jpg'),
            Livro('assets/images/1.jpg'),
          ],
        ),
      ],
    );
  }
}
