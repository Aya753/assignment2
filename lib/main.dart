import 'package:assignment2/home.dart';
import 'package:assignment2/login.dart';
import 'package:assignment2/sign.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Login(),

      routes: {
        'login': (_) => Login(),
        'firstHome': (_) => firstP(),
        'Signin': (_) => sign(),
      },
    );
  }
}
