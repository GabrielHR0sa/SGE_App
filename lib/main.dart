import 'package:flutter/material.dart';
import 'package:sge_app/src/view/home_page.dart';
import 'package:sge_app/src/view/login_page.dart';
import 'package:sge_app/src/view/product_page.dart';
import 'package:sge_app/src/view/production_page.dart';
import 'package:sge_app/src/view/sell_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
        scaffoldBackgroundColor: const Color.fromARGB(255, 209, 209, 209),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 54, 54, 54)),
        useMaterial3: true,
      ),
      initialRoute: ('/Login'),
      routes: {
        ('/Home'): (context) => const HomePage(),
        ('/Products'): (context) => const ProductsPage(),
        ('/Production'): (context) => const ProductionPage(),
        ('/Sell'): (context) => const SellsPage(),
        ('/Login'): (context) => const LoginPage(),
      },
    );
  }
}
