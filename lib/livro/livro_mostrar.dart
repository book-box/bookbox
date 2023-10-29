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

  @override
  void initState() {
    super.initState();
    _loadBookLink();
    
  }

  Future<void> _loadBookLink() async {
    final book = await widget.buildLivroMostrarWidget();
    if (book != null) {
      final link = await getBookLink(book.id);
      setState(() {
        _bookLink = link;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: _bookLink != null
          ? Image.network(
              _bookLink!,
              fit: BoxFit.cover,
            )
          : const CircularProgressIndicator(),
    );
  }

  Future<String?> getBookLink(String id) async {
    final book = await BookService.getBookById(id);
    log("Book: $book");
    return book?.volumeInfo.imageLinks.thumbnail;
  }
}
