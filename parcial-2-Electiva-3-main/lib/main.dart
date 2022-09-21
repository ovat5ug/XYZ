import 'package:flutter/material.dart';
import 'package:parcial2_etps3/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcial 2 , sillas hermosas del camino feliz',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(227, 34, 6, 90),
      ),
      home: HomePage(),
    );
  }
}
