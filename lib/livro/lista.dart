import 'package:bookbox/common/book_card.dart';
import 'package:bookbox/livro/models/book.dart';
import 'package:bookbox/livro/services/books_service.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  final String? livroID;
  final String titulo;
  const Lista({required this.titulo, required this.livroID, Key? key})
      : super(key: key);

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  List<Book> _books = <Book>[];

  @override
  void initState() {
    super.initState();

    if (widget.livroID != null) {
      BookService.getBookById(widget.livroID!).then((value) {
        if (value != null) {
          List<String> query = value.volumeInfo.title!.split(' ');

          int idx = 0;
          while (idx < query.length && query[idx].length < 3) {
            idx++;
          }

          BookService.searchBooks(query: query[idx]).then((value) {
            setState(() {
              _books = value;
            });
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.titulo,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 213, 213, 213),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _books.length,
            itemBuilder: (context, idx) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: BookCard(
                  id: _books[idx].id,
                  link: _books[idx].volumeInfo.imageLinks.thumbnail,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
