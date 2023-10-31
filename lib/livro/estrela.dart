import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bookbox/livro/data.dart';

class Estrela extends StatefulWidget {

  const Estrela({Key? key}) : super(key: key);

  @override
  State<Estrela> createState() => _EstrelaState();
}

class _EstrelaState extends State<Estrela> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notaNotifier,
      builder: (context, String nota, _) {
         
        return Column( // Add return here
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                nota,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 182, 182, 182),
                ),
              ),
            ),
            Container(
              width: 45,
              constraints: const BoxConstraints(minWidth: 120),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 255, 184, 69), size: 22),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 255, 184, 69), size: 22),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 255, 184, 69), size: 22),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 255, 184, 69), size: 22),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 255, 184, 69), size: 22),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}