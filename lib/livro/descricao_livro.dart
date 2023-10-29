import 'dart:developer';


import 'package:bookbox/livro/models/book.dart';
import 'package:bookbox/livro/services/books_service.dart';
import 'package:flutter/material.dart';

class DescricaoLivro extends StatefulWidget {
  final String? livroID;
  const DescricaoLivro({this.livroID, Key? key}) : super(key: key);
  

  @override
  State<DescricaoLivro> createState() => _DescricaoLivroState();
  

  Future<Book?> buildDescricaoLivroWidget() async {
    log("LivroID: $livroID");
    if (livroID != null) {
      final book = await BookService.getBookById(livroID!);
      return book;
    } else {
      return null;
    }
  }

}

class _DescricaoLivroState extends State<DescricaoLivro> {
  String? _bookDesciption;

  @override
  void initState() {
    super.initState();
    _loadBookdesciption();
    
  }

  Future<void> _loadBookdesciption() async {
    final book = await widget.buildDescricaoLivroWidget();
    if (book != null) {
      final desciption = await getBookDesciption(book.id);
      setState(() {
        _bookDesciption = desciption;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _bookDesciption != null
          ? Text(
              _bookDesciption!,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            )
          : const CircularProgressIndicator(),
    );
  }

  Future<String?> getBookDesciption(String id) async {
    final book = await BookService.getBookById(id);
    log("Book: $book");
    return book?.volumeInfo.description;
  }
}
