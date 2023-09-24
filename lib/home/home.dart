import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SectionWithCards(
            sectionTitle: 'Lançamentos',
            cardCount: 5,
          ),
          SectionWithCards(
            sectionTitle: 'Em alta',
            cardCount: 5,
          ),
          SectionWithCards(
            sectionTitle: 'Seus amigos estão lendo',
            cardCount: 5,
          ),
          SectionWithCards(
            sectionTitle: 'Autores em alta',
            cardCount: 5,
          ),
        ],
      ),
    );
  }
}

class SectionWithCards extends StatelessWidget {
  final String sectionTitle;
  final int cardCount;

  const SectionWithCards(
      {required this.sectionTitle, required this.cardCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sectionTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 92, 103, 112),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              cardCount,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/livro');
                  },
                  child: Card(
                    color: Colors.white,
                    child: SizedBox(
                      width: 100,
                      height: 160,
                      child: Center(
                        child: Text('Card $index'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


