import 'package:flutter/material.dart';

class GradientBook extends StatelessWidget {
  const GradientBook(this.child, {super.key});

  final Widget child;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 25, 25, 25),
            Color.fromARGB(255, 33, 33, 33),
            Color.fromARGB(255, 33, 33, 33),
            Color.fromARGB(255, 33, 33, 33),
            Color.fromARGB(255, 33, 33, 33),
            Color.fromARGB(255, 33, 33, 33),
            Color.fromARGB(255, 33, 33, 33),
            Color.fromARGB(255, 33, 33, 33),
            Color.fromARGB(255, 33, 33, 33),
            Color.fromARGB(255, 33, 33, 33),
          ],
        ),
      ),
      child: child,
    );
  }
}
