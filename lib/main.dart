import 'package:flutter/material.dart';
import 'package:howsmycoffee/provider/favorite_provider.dart';
import 'package:howsmycoffee/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => FavouriteProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF212325),
      ),
      home: WelcomeScreen(),
    );
  }
}
