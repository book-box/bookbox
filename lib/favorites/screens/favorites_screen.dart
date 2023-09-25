import 'package:bookbox/common/navbar.dart';
import 'package:bookbox/favorites/components/books_grid.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      bottomNavigationBar: const Navbar(),
      body: const BooksGrid(title: 'NOME DA LISTA'),
    );
  }
}
