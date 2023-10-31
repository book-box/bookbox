
import 'dart:developer';

import 'package:bookbox/livro/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bookbox/db/service/database_helper.dart';
import 'package:bookbox/livro/models/book.dart';
import 'package:bookbox/livro/services/books_service.dart';

class BotoesLivro extends StatefulWidget {
  final String? idLivro;

  const BotoesLivro({this.idLivro, Key? key}) : super(key: key);

  @override
  State<BotoesLivro> createState() => _BotoesLivroState();
}

class _BotoesLivroState extends State<BotoesLivro> {
  final TextEditingController _controller = TextEditingController();

  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 1),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 60,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.browse_gallery_outlined,
                  color: Color.fromARGB(255, 225, 225, 225),
                  size: 55,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 2),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Quero ler',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 60,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.format_list_bulleted_add,
                  color: Color.fromARGB(255, 225, 225, 225),
                  size: 55,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 2),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Add lista',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 60,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.menu_book,
                  color: Color.fromARGB(255, 225, 225, 225),
                  size: 55,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 300,
                        child: Container(
                          color: const Color.fromARGB(255, 57, 56, 56),
                          child: Column(
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                    labelText: "Adicionar nota"),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: _controller,
                              ),
                              ElevatedButton(
                                child: const Text('Submit'),
                                onPressed: () {
                                  final String nota = _controller.text;
                                  notaNotifier.value = nota;
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 2),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Lido',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  Future<Book?> getBook(String id) async {
    final book = await BookService.getBookById(id);
    return book;
  }
}
