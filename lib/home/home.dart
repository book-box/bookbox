import 'package:flutter/material.dart';

import 'package:bookbox/livro/models/book.dart';
import 'package:bookbox/livro/services/books_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionWithCards(
              sectionTitle: 'Lançamentos',
              query: 'flowers',
            ),
            SectionWithCards(
              sectionTitle: 'Em alta',
              query: 'Thunder',
            ),
            SectionWithCards(
              sectionTitle: 'Seus amigos estão lendo',
              query: 'Good',
            ),
            SectionWithCards(
              sectionTitle: 'Autores em alta',
              query: 'Live',
            ),
          ],
        ),
      ),
    );
  }
}

class SectionWithCards extends StatelessWidget {
  final String sectionTitle;
  final String query;

  const SectionWithCards({
    Key? key,
    required this.sectionTitle,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            sectionTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<List<Book>>(
            future: BookService.searchBooks(query: query),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final books = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                        book.volumeInfo.imageLinks.thumbnail ?? '',
                        width: 120,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text('Erro ao carregar lançamentos'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
