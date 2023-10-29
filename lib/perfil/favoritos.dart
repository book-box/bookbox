import 'dart:developer';

import 'package:bookbox/livro/services/books_service.dart';
import 'package:flutter/material.dart';

import 'package:bookbox/livro/models/book.dart';

import 'package:bookbox/perfil/services/profile_service.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  List<Book> books = <Book>[];

  @override
  void initState() {
    super.initState();
    //refresh();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: buildFavoritosWidget(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<Widget> buildFavoritosWidget() async {
    final favoritosList = await ProfileService().getFavoriteBooks();
    final List<String?> link = [];
    for (var book in favoritosList) {
      link.add(await getBookLink(book));
    }
    log(link.toString());
    log('Favoritos $favoritosList');
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Favoritos',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BookContainer(link: link[0]),
            BookContainer(link: link[1]),
            BookContainer(link: link[2]),
            BookContainer(link: link[3]),
            BookContainer(link: link[4]),
          ],
        ),
      ],
    );
  }

  Future<String?> getBookLink(String id) async {
    final book = await BookService().getBookById(id);
    return book?.volumeInfo.imageLinks.thumbnail;
  }
}

class BookContainer extends StatelessWidget {
  final String? link;

  const BookContainer({this.link, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 61,
      height: 94,
      child: link != null
          ? Image.network(
              link!,
            )
          : const Center(
              child: Icon(Icons.image),
            ),
    );
  }
}