import 'package:flutter/material.dart';

class LidoPor extends StatelessWidget {
  const LidoPor(this.nota, {Key? key}) : super(key: key);

  final String nota;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topLeft, 
          child: Text(
            nota,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 204, 204, 204),
            ),
          ),
        ),
        const SizedBox(height: 10),
         const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
              SizedBox(width: 2),
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
              SizedBox(width: 2),
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
              SizedBox(width: 2),
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
              SizedBox(width: 2),
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
              SizedBox(width: 2),
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
              SizedBox(width: 2),
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
              SizedBox(width: 2),
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
              SizedBox(width: 2),
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
              SizedBox(width: 2),
              Icon(Icons.circle, color: Color.fromARGB(255, 210, 206, 199), size: 30),
            ],
          ),
        
      ],
    );
  }
}
