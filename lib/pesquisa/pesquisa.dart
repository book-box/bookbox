import 'package:bookbox/livro/models/book.dart';
import 'package:bookbox/livro/services/books_service.dart';
import 'package:bookbox/pesquisa/components/book_grid.dart';
import 'package:flutter/material.dart';

import 'dart:developer';

class Pesquisa extends StatefulWidget {
  const Pesquisa({Key? key}) : super(key: key);

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  List<Book> books = <Book>[];

  @override
  void initState() {
    super.initState();
    _searchBooks('dog');
  }

  void _searchBooks(String query) {
    BookService.searchBooks(query: query).then((value) {
      setState(() {
        books = value;
        log("livros$books");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSearchField(),
          Container(height: 10.0, color: Colors.black),
          const SizedBox(height: 10.0),
          Expanded(
            child: BookGrid(books: books),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Pesquisa"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  Widget _buildSearchField() {
    return Container(
      color: Colors.black,
      child: SizedBox(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onSubmitted: _searchBooks,
            decoration: const InputDecoration(
              labelText: 'Pesquisar',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              focusColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  color: Color(0xff65d0e0),
                  width: 1.0,
                ),
              ),
              filled: true,
              fillColor: Color(0xD9D9D9FF),
            ),
          ),
        ),
      ),
    );
  }
}
