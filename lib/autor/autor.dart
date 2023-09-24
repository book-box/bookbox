import 'package:flutter/material.dart';
import 'package:bookbox/autor/top_bar_estande.dart';
import 'package:bookbox/autor/lista.dart';
import 'package:bookbox/autor/olivro.dart';

class Autor extends StatelessWidget {
  const Autor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopBarEstante(),
          Olivro(),
          SizedBox(height: 25),
          Text(
            'NOME DO AUTOR.',
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 239, 239, 239),
            ),
          ),
          Column(
            children: [
              Divider(color: Color.fromARGB(255, 167, 167, 167)),
              Text(
                'Aqui vem a descrição do Autor.',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 167, 167, 167),
                ),
              ),
              SizedBox(height: 20),
              Divider(color: Color.fromARGB(255, 167, 167, 167)),
              Lista('Livros:'),
              Lista(''),
              Divider(color: Color.fromARGB(255, 167, 167, 167)),
              Lista('Relacionados:'),
            ],
          ),
        ],
      ),
    );
  }
}
