import 'package:flutter/material.dart';
import 'package:flutter_pokedesk/paginas/home.dart';

void main() {
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
