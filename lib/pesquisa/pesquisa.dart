import 'package:bookbox/livro/models/book.dart';
import 'package:bookbox/livro/services/books_service.dart';
import 'package:bookbox/pesquisa/components/book_grid.dart';
import 'package:flutter/material.dart';

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

    BookService.searchBooks(query: 'Cat').then((value) {
      setState(() {
        books = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (query) {
                BookService.searchBooks(query: query).then((value) {
                  setState(() {
                    books = value;
                  });
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Search for books...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: BookGrid(books: books),
          ),
        ],
      ),
    );
  }
}
