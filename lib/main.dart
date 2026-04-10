import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'home_page.dart';
import 'product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomePage(),
        '/products': (context) => const ProductScreen(),
      },
    );
  }
}
