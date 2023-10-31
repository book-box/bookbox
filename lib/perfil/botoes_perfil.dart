import 'package:flutter/material.dart';

class BotoesPerfil extends StatelessWidget {
  const BotoesPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BotaoPerfil('GOSTEI', Color.fromARGB(255, 222, 188, 235), '/gostei'),
              BotaoPerfil('ESTANTE', Color.fromARGB(255, 101, 208, 224), '/estante'),
              BotaoPerfil('LIDOS', Color.fromARGB(255, 180, 235, 61), '/gostei'),
            ],
          ),
        ),
      ),
    );
  }
}

class BotaoPerfil extends StatelessWidget {
  const BotaoPerfil(this.text, this.color, this.path, {Key? key}) : super(key: key);
  final String text;
  final Color color;
  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 35,
      child: ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(
            context,
            path,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const StadiumBorder(),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
