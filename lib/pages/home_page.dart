import 'package:flutter/material.dart';

import 'package:bookbox/home/home.dart';

import 'package:bookbox/common/gradient.dart';
import 'package:bookbox/common/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BOOKBOX',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      bottomNavigationBar: const Navbar(),
      body: const GradientBook(Home()),
    );
  }
}
