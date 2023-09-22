import 'package:flutter/material.dart';

class Seguidores extends StatelessWidget{
  const Seguidores({super.key});

  @override
  Widget build(context){
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,      
      children: [
        SizedBox(width: 20),
        SeguiContainer('3', 'seguidores'),
        SeguiContainer('5', 'seguindo'),
      ],
    );
  }
}

class SeguiContainer extends StatelessWidget{
  const SeguiContainer(this.num, this.segui, {super.key});
  
  final String num;
  final String segui;

  @override
  Widget build(context){
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color:const Color.fromARGB(255, 34, 11, 11),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            num,
            style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
            )
          ),
          Text(
            segui,
            style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}