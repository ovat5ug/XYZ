import 'package:flutter/material.dart';
import 'package:parcial2_etps3/menusComensal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcial 2 , Tortas el SARCO',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(226, 226, 222, 233),
      ),
      home: HomePage(),
    );
  }
}
