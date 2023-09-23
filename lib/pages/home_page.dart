import 'package:flutter/material.dart';
import 'package:bookbox/home/home.dart';
import 'package:bookbox/common/navbar.dart';
import 'package:bookbox/common/topbar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return const Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      bottomNavigationBar: Navbar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Topbar(),
      ),
      body: Home(),
    );
  }
}