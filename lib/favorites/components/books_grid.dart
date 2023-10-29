import 'package:bookbox/common/gradient.dart';
import 'package:bookbox/livro/services/books_service.dart';
import 'package:flutter/material.dart';

import '../../livro/models/book.dart';

class BooksGrid extends StatefulWidget {
  final String? title;

  const BooksGrid({this.title, Key? key}) : super(key: key);

  @override
  State<BooksGrid> createState() => _BooksGridState();
}

class _BooksGridState extends State<BooksGrid> {
  List<Book> books = <Book>[];

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBook(
      CustomScrollView(
        slivers: [
          (widget.title != null)
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(widget.title!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                )
              : const SliverToBoxAdapter(),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _SliverGridCard(
                  link: books[index].volumeInfo.imageLinks.thumbnail,
                );
              },
              childCount: books.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32.0,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> refresh() async {
    List<Book> list = await BookService.searchBooks(
        query: 'Harry Potter', numberOfElements: 40);

    setState(() {
      books = list;
    });
  }
}

class _SliverGridCard extends StatelessWidget {
  final String? link;

  const _SliverGridCard({this.link, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: link != null
            ? Image.network(
                link!,
                fit: BoxFit.cover,
              )
            : const Center(
                child: Icon(Icons.image),
              ),
      ),
    );
  }
}
