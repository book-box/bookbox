import 'package:flutter/material.dart';

class BotoesLivro extends StatelessWidget {
  const BotoesLivro({Key? key}) : super(key: key);

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
}
