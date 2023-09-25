import 'package:bookbox/pages/estante_page.dart';
import 'package:flutter/material.dart';

class BotoesPerfil extends StatelessWidget {
  const BotoesPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BotaoPerfil('GOSTEI', Color.fromARGB(255, 222, 188, 235), '/gostei'),
          SizedBox(width: 30),
          BotaoPerfil('ESTANTE', Color.fromARGB(255, 101, 208, 224), '/estante'),
          SizedBox(width: 30),
          BotaoPerfil('LIDOS', Color.fromARGB(255, 180, 235, 61), '/lidos'),
        ],
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
    return ElevatedButton(
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
    );
  }
}
