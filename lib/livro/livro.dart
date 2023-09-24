import 'package:flutter/material.dart';
import 'package:bookbox/livro/livro_mostrar.dart';
import 'package:bookbox/livro/botoes_livro.dart';
import 'package:bookbox/livro/lista.dart';
import 'package:bookbox/livro/estrela.dart';
import 'package:bookbox/livro/topbar_livro.dart';
import 'package:bookbox/livro/lido_por.dart';

class Livro extends StatelessWidget {
  const Livro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopBarEstante(),
          Estrela('4.5'),
          SizedBox(height: 5),
          LivroMostrar(),
          SizedBox(height: 10),
          BotoesLivro(),
          SizedBox(height: 10),
          Column(
            children: [
              Divider(color: Color.fromARGB(255, 167, 167, 167)),
              Text(
                'Aqui vem a descrição do livro.',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 167, 167, 167),
                ),
              ),
              SizedBox(height: 20),
              Divider(color: Color.fromARGB(255, 167, 167, 167)),
              LidoPor('Lido Por:'),
              SizedBox(height: 15),
              Lista('Relacionados:'),
            ],
          ),
        ],
      ),
    );
  }
}
