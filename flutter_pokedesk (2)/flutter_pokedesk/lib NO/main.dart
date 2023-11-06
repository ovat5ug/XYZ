import 'package:flutter/material.dart';
import 'package:flutter_applirest/pantallas/modelo/gif.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(AppiRest());
}

class AppiRest extends StatelessWidget {
  late Future<List<Gif>> _listadegif;

  Future<List<Gif>> _getGifs() async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=sw1fM8if1R79iCYYzGzG4QvF4ix8Mp7O&limit=10&rating=g"));
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
      title: 'Api Rest',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material Appi'),
          ),
          body: Center(
            child: Container(child: Text("saludos")),
          )),
    );
  }
}
