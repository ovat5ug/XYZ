import 'package:flutter/material.dart';
//"flutter pub add http" instalar libreria para que busque el valor de los enlaces "http"
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//"flutter pub add cached_network_image" instalar libreria para que busque el valor de los enlaces de img de internet
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/paginas/jsonGif/gif.dart';

import 'DetalleProductos.dart';

class principalHome extends StatefulWidget {
  const principalHome({Key? key}) : super(key: key);

  @override
  State<principalHome> createState() => _principalHomeState();
}

class _principalHomeState extends State<principalHome> {
  final pokeApi = http.get(Uri.parse(
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
      "https://api.giphy.com/v1/gifs/trending?api_key=pePjWdDPMIQfsxdENxxyNAFrlNEzD3XL&limit=25&rating=g"));
  List pokedesk = [];
  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width; //Ancho segun el contexto
    var alto = MediaQuery.of(context).size.height; //Alto segun el contexto
    return Scaffold(
        //dibujamos fondo
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              bottom: -50,
              right: -50,
              child: Image.asset(
                "assets/img/pokebola.png", //pokebola en esquina inferior derecha
                width: 200, //tamaño pokebola de fondo
                fit: BoxFit
                    .fitWidth, //ajusta en relacion a la altura de la imagen
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Text(
                "Pokedex UTEC",
                style: TextStyle(
                    fontSize: 30, //tamaño font titulo del pokedex
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
                          var tipo = pokedesk[index]['type']
                              [0]; //hala los datos del json que esta en la URL

                          return InkWell(
                            child: Padding(
                              //padin interno de la tarjetita
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8),
                              child: Container(
                                  decoration: BoxDecoration(
//agrega color a las tarjetas dependientdo del tipo del pokemon
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
                                        "assets/img/pokebola.png",
                                        height: 50, //tamaño de la pokebola
                                        fit: BoxFit.fitHeight,
                                        //ajusta en relacion a la anchura de la imagen
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 20,
                                        child: Text(
                                          pokedesk[index]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  18, //tamaño del nombre del pokemon
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
                                                //capturo la posicion del arreglo "tipo" y se convierte en string (en texto)
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        10)), //tamaño tipo pokemon
                                          ),
                                          decoration: BoxDecoration(
                                              //caja decoracion tipo pokemon
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black26),
                                        )),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: CachedNetworkImage(
                                        imageUrl: pokedesk[index]['img'],
                                        height: 80, //tamaño del img pokemon
                                        fit: BoxFit.fitHeight,
                                        //ajusta en relacion a la anchura de la imagen
                                      ),
                                    ),
                                  ])),
                            ),
                            onTap: () {
                              //TODO: llamar pantalla
                              //Navigator.push(
                              //  context,
                              //MaterialPageRoute(
                              //builder: (_) => DetalleProductos(
                              //  jsonDetalle: pokedesk[index],
                              //color: Colors.green,
                              //idpokemon: index)));
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
    var URL01 = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(URL01).then((value) {
      if (value.statusCode == 200) {
        var decodejsonData = convert.jsonDecode(value.body);
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
