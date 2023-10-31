import 'package:bookbox/livro/descricao_livro.dart';
import 'package:flutter/material.dart';
import 'package:bookbox/livro/livro_mostrar.dart';
import 'package:bookbox/livro/botoes_livro.dart';
import 'package:bookbox/livro/lista.dart';
import 'package:bookbox/livro/estrela.dart';
import 'package:bookbox/livro/topbar_livro.dart';
import 'package:bookbox/livro/lido_por.dart';


class Livro extends StatelessWidget {
  final String? bookId;
  const Livro({this.bookId ,Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TopBarEstante(),
            const Estrela('4.5'),
            const SizedBox(height: 5),
            LivroMostrar(livroID: bookId),
            const SizedBox(height: 20),
            const BotoesLivro(),
            const SizedBox(height: 10),
            const Divider(color: Color.fromARGB(255, 167, 167, 167)),
            DescricaoLivro(livroID: bookId),
            Column(
              children: [
                const SizedBox(height: 20),
                const Divider(color: Color.fromARGB(255, 167, 167, 167)),
                const LidoPor('Lido Por:'),
                const SizedBox(height: 15),
                Lista(titulo: 'Relaciondos:', livroID: bookId),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
