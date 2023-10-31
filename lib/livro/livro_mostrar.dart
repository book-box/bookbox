import 'dart:developer';

import 'package:bookbox/livro/models/book.dart';
import 'package:bookbox/livro/services/books_service.dart';
import 'package:flutter/material.dart';


class LivroMostrar extends StatefulWidget {
  final String? livroID;
  const LivroMostrar({this.livroID, Key? key}) : super(key: key);
  

  @override
  State<LivroMostrar> createState() => _LivroMostrarState();
  

  Future<Book?> buildLivroMostrarWidget() async {
    log("LivroID: $livroID");
    if (livroID != null) {
      final book = await BookService.getBookById(livroID!);
      return book;
    } else {
      return null;
    }
  }

}

class _LivroMostrarState extends State<LivroMostrar> {
  String? _bookLink;
  List<String>? _bookAutor;
  String? _bookData;
  String? _bookName;

  @override
  void initState() {
    super.initState();
    _loadBook();
    
  }

  Future<void> _loadBook() async {
    final book = await widget.buildLivroMostrarWidget();
    if (book != null) {
      final link = await getBookLink(book.id);
      setState(() {
        _bookLink = link;
      });
    }

    final bookAutor = await widget.buildLivroMostrarWidget();
    if (bookAutor != null) {
      final autor = await getBookAutor(bookAutor.id);
      if (mounted) {
        setState(() {
          _bookAutor = autor;
        });
      }
    }

    final bookData = await widget.buildLivroMostrarWidget();
    if (bookData != null) {
      final data = await getBookData(bookData.id);
      if (mounted) {
        setState(() {
          _bookData = data;
        });
      }
    }

    final bookName = await widget.buildLivroMostrarWidget();
    if (bookName != null) {
      final name = await getBookName(bookName.id);
      if (mounted) {
        setState(() {
          _bookName = name;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String bookAutorString = _bookAutor?.join(', ') ?? '';
    bookAutorString = 'Autor: $bookAutorString';
    String bookDataString = _bookData ?? '';
    bookDataString = 'Ano: $bookDataString';

    return Column(
      children: [
        const SizedBox(height: 10),
        GestureDetector(
          onTap: null,
          child: _bookLink != null
              ? Image.network(
                  _bookLink!,
                  fit: BoxFit.cover,
                )
              : const CircularProgressIndicator(),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Text(
            _bookName?.toUpperCase() ?? '',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              bookDataString,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 17,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),
            Text(
              bookAutorString,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),
          ],
        )
      ],
    );
  }

  Future<String?> getBookLink(String id) async {
    final book = await BookService.getBookById(id);
    return book?.volumeInfo.imageLinks.thumbnail;
  }

  Future<List<String>> getBookAutor(String id) async {
    final book = await BookService.getBookById(id);
    return book!.volumeInfo.authors!;
  }

  Future<String?> getBookData(String id) async {
    final book = await BookService.getBookById(id);
    return book?.volumeInfo.publishedDate?.year.toString();
  }

  Future<String?> getBookName(String id) async {
    final book = await BookService.getBookById(id);
    return book?.volumeInfo.title;
  }
}
