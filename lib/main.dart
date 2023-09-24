import 'package:flutter/material.dart';

import 'package:bookbox/pages/estante_page.dart';
import 'package:bookbox/pages/perfil_page.dart';
import 'package:bookbox/pages/autor_page.dart';
import 'package:bookbox/pages/home_page.dart';
import 'package:bookbox/pages/livro_page.dart';
import 'package:bookbox/pages/pesquisa_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'BookBox', initialRoute: '/', routes: {
      '/': (context) => const HomePage(),
      '/autor': (context) => const AutorPage(),
      '/estante': (context) => const EstantePage(),
      '/livro': (context) => const LivroPage(),
      '/perfil': (context) => const PerfilPage(),
      '/pesquisa': (context) => const PesquisaPage(),
    });
  }
}
