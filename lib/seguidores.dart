import 'package:flutter/material.dart';

class Seguidores extends StatelessWidget{
  const Seguidores({super.key});

  @override
  Widget build(context){
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,      
      children: [
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
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      height: 25,
      width: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:const Color.fromARGB(255, 56, 55, 55),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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