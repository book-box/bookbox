import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String id;
  final String? link;

  const BookCard({required this.id, this.link, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/livro',
          arguments: {
            'id': id,
          },
        );
      },
      child: Container(
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
      ),
    );
  }
}