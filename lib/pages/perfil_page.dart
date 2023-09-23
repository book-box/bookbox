import 'package:flutter/material.dart';
import 'package:bookbox/common/navbar.dart';
import 'package:bookbox/perfil/perfil.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      bottomNavigationBar: Navbar(),
      body: Perfil(),
    );
  }
}