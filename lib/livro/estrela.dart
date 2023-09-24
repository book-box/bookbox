import 'package:flutter/material.dart';

class Estrela extends StatelessWidget {
  const Estrela(this.nota, {Key? key}) : super(key: key);

  final String nota;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Icon(Icons.star, color: Color.fromARGB(255, 255, 184, 69), size: 22),
              
              Icon(Icons.star, color: Color.fromARGB(255, 255, 184, 69), size: 22),
             
              Icon(Icons.star, color: Color.fromARGB(255, 255, 184, 69), size: 22),
          
              Icon(Icons.star, color: Color.fromARGB(255, 255, 184, 69), size: 22),
              
              Icon(Icons.star, color: Color.fromARGB(255, 255, 184, 69), size: 22),
            ],
          ),
        ),
      ],
    );
  }
}
