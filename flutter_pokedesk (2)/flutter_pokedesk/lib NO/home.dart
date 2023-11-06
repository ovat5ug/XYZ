import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

import 'detallepokemon.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List pokedesk = [];
  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              bottom: -50,
              right: -50,
              child: Image.asset(
                "assets/img/pokeball.png",
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Text(
                "Pokedex UTEC",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Positioned(
              top: 150,
              bottom: 0,
              width: ancho,
              child: Column(children: [
                pokedesk.length != null
                    ? Expanded(
                        child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                        itemCount: pokedesk.length,
                        itemBuilder: (context, index) {
                          var tipo = pokedesk[index]['type'][0];

                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: pokedesk[index]['type'][0] ==
                                              "Grass"
                                          ? Colors.greenAccent
                                          : pokedesk[index]['type'][0] == "Fire"
                                              ? Colors.redAccent
                                              : pokedesk[index]['type'][0] ==
                                                      "Water"
                                                  ? Colors.blue
                                                  : pokedesk[index]['type'][0] ==
                                                          "Poison"
                                                      ? Colors.deepPurpleAccent
                                                      : pokedesk[index]['type']
                                                                  [0] ==
                                                              "Electric"
                                                          ? Colors.amber
                                                          : pokedesk[index]
                                                                          ['type']
                                                                      [0] ==
                                                                  "Rock"
                                                              ? Colors.grey
                                                              : pokedesk[index]
                                                                              ['type']
                                                                          [0] ==
                                                                      "Ground"
                                                                  ? Colors.brown
                                                                  : pokedesk[index]['type'][0] ==
                                                                          "Psychic"
                                                                      ? Colors
                                                                          .indigo
                                                                      : pokedesk[index]['type'][0] ==
                                                                              "Fighting"
                                                                          ? Colors
                                                                              .orange
                                                                          : pokedesk[index]['type'][0] == "Bug"
                                                                              ? Colors.lightGreenAccent
                                                                              : pokedesk[index]['type'][0] == "Ghost"
                                                                                  ? Colors.deepPurple
                                                                                  : pokedesk[index]['type'][0] == "Normal"
                                                                                      ? Colors.black26
                                                                                      : Colors.pink,
                                      /**
                                       *  "Fire",*
                                          "Ice",
                                          "Flying",
                                          "Psychic"
                                       * "Water",*
                                          "Ground",*
                                          "Rock"*
                                       */

                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Stack(children: [
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Image.asset(
                                        "assets/img/pokeball.png",
                                        height: 50,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 20,
                                        child: Text(
                                          pokedesk[index]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),
                                        )),
                                    Positioned(
                                        top: 45,
                                        left: 20,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(tipo.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10)),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black26),
                                        )),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: CachedNetworkImage(
                                        imageUrl: pokedesk[index]['img'],
                                        height: 80,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ])),
                            ),
                            onTap: () {
                              //TODO: llamar pantalla
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetallePokemon(
                                          pokemonDetalle: pokedesk[index],
                                          color: Colors.green,
                                          idpokemon: index)));
                            },
                          );
                        },
                      ))
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ]),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      datosPokemon();
    }
  }

  void datosPokemon() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodejsonData = jsonDecode(value.body);
        pokedesk = decodejsonData['pokemon'];
        //print(pokedesk[2]['name']);
        setState(() {});
      }

      //  print(decodejsonData);

      //   print(pokedesk);
    });
    //200 correcto
    //404 incorrecto
    //500
    //505,504,505
  }
}
