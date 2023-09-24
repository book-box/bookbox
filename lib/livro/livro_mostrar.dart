import 'package:flutter/material.dart';

class LivroMostrar extends StatelessWidget {
  const LivroMostrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.spaceEvenly;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/autor');
      },
      child: Container(
        width: 180,
        height: 250,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
