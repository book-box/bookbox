import 'package:flutter/material.dart';

class Estante extends StatelessWidget {
  const Estante({super.key});

  @override
  Widget build(context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TopBarEstante(),
          SizedBox(height: 20),
          ListaEstante(Colors.lightBlue),
          Divider(
            color: Colors.black,
            thickness: 15,
          ),
          SizedBox(height: 20),
          ListaEstante(Colors.lightGreen),
          Divider(
            color: Colors.black,
            thickness: 15,
          ),
          SizedBox(height: 20),
          ListaEstante(Colors.pinkAccent),
          Divider(
            color: Colors.black,
            thickness: 15,
          ),
          SizedBox(height: 20),
          ListaEstante(Colors.purpleAccent),
          Divider(
            color: Colors.black,
            thickness: 15,
          ),
        ],
      ),
    );
  }
}

class TopBarEstante extends StatelessWidget {
  const TopBarEstante({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 35),
          child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.analytics_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class LivroEstante extends StatelessWidget {
  const LivroEstante(this.nome, this.color, {super.key});

  final String nome;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
      ),
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          nome,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ListaEstante extends StatelessWidget {
  const ListaEstante(this.color, {super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LivroEstante('nome 1', color),
        LivroEstante('nome 2', color),
        LivroEstante('nome 3', color),
        LivroEstante('nome 4', color),
        LivroEstante('nome 5', color),
        LivroEstante('nome 6', color),
        LivroEstante('nome 7', color),
        LivroEstante('nome 8', color),
        LivroEstante('nome 9', color),
        LivroEstante('nome 10', color),
      ],
    );
  }
}
