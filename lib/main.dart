import 'package:flutter/material.dart';
import 'package:howsmycoffee/provider/favorite_provider.dart';
import 'package:howsmycoffee/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavouriteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF212325),
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
