import 'package:bookbox/pesquisa/pesquisa.dart';

import 'package:flutter/material.dart';

import 'package:bookbox/common/navbar.dart';
import 'package:bookbox/common/gradient.dart';

class PesquisaPage extends StatelessWidget {
  const PesquisaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 15, 15),
      bottomNavigationBar: Navbar(),
      body: GradientBook(Pesquisa()),
    );
  }
}