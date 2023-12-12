import 'package:bookbox/livro/models/book.dart';
import 'package:flutter/material.dart';

class BookGrid extends StatelessWidget {
  final List<Book> books;

  const BookGrid({required this.books, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          _buildBookGrid(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 32.0),
          ),
        ],
      ),
    );
  }

  Widget _buildBookGrid() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => _SliverGridCard(
          id: books[index].id,
          link: books[index].volumeInfo.imageLinks.thumbnail,
        ),
        childCount: books.length,
      ),
    );
  }
}

class _SliverGridCard extends StatelessWidget {
  final String? link;
  final String id;

  const _SliverGridCard({required this.id, this.link, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/livro',
          arguments: {'id': id},
        );
      },
      child: _buildCardContents(),
    );
  }

  Widget _buildCardContents() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: link != null
            ? Image.network(link!, fit: BoxFit.cover)
            : const Center(child: Icon(Icons.image)),
      ),
    );
  }
}
