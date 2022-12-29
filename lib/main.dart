import 'package:bmi_app/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white10,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              headline2: TextStyle(
                fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white
              )
        ),
      ),
      home: HomeScreen(),
    );
  }
}
