import 'package:bookbox/favorites/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

import 'package:bookbox/authentication/screens/login_screen.dart';
import 'package:bookbox/pages/estante_page.dart';
import 'package:bookbox/pages/perfil_page.dart';
import 'package:bookbox/pages/autor_page.dart';
import 'package:bookbox/pages/home_page.dart';
import 'package:bookbox/pages/livro_page.dart';
import 'package:bookbox/pages/pesquisa_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, 
  );
  
  await FirebaseAuth.instance.signOut();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'BookBox', theme: ThemeData.dark(), initialRoute: '/', debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const ScreenReplacer(),
      '/autor': (context) => const AutorPage(),
      '/estante': (context) => const EstantePage(),
      '/livro': (context) => const LivroPage(),
      '/perfil': (context) => const PerfilPage(),
      '/pesquisa': (context) => const PesquisaPage(),
      '/gostei': (context) => const FavoritesScreen(),
    });
  }
}

class ScreenReplacer extends StatelessWidget {
  const ScreenReplacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
