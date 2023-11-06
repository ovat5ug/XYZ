import 'package:flutter/material.dart';
import 'package:legacy_buttons/LegacyRaisedButton.dart';
import 'package:pokedex/paginas/jsonGif/gif.dart';
import 'package:pokedex/paginas/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(pokeDesk());
}

class pokeDesk extends StatelessWidget {
  //const pokeDesk({super.key});
  late Future<List<Gif>> _listadegif;

  Future<List<Gif>> _getGifs() async {
    //genera una lista consultando el contedo a "gif" en su contenido
    //future es una API sirve para construir en base a lo que se esta capturando por la clase "Gif"
    final response = await http.get(Uri.parse(
        //"https://api.giphy.com/v1/gifs/trending?api_key=sw1fM8if1R79iCYYzGzG4QvF4ix8Mp7O&limit=10&rating=g"
        "https://api.giphy.com/v1/gifs/trending?api_key=pePjWdDPMIQfsxdENxxyNAFrlNEzD3XL&limit=25&rating=g"));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception("Falla al gerenar el JSON");
    }
    return _listadegif;
  }

  @override
  void initState() {
    _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: principalHome(),
      title: 'Api Rest',
    );
  }
}
