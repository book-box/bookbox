import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:bookbox/livro/livro.dart';

import 'package:bookbox/common/navbar.dart';
import 'package:bookbox/common/gradient.dart';

class LivroPage extends StatefulWidget {
  const LivroPage({super.key});

  @override
  State<LivroPage> createState() => _LivroPageState();
}

class _LivroPageState extends State<LivroPage> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    final String? bookId = arg['id'];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      bottomNavigationBar: const Navbar(),
      body: GradientBook(Livro(bookId: bookId)),
    );
  }
}
