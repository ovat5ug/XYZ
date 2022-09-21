import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:parcial2_etps3/muebles.dart';
import 'package:parcial2_etps3/muebles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 0),
      child: Column(
          //mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              CrossAxisAlignment.start, //alinea al lado izquierdo
          children: [
            Container(
              //dibuja boton de menu
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Color(0xFF323232), boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                )
              ]),
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              "Comercial SIVAR",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 253, 253),
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              child: TextField(
                cursorColor: Colors.white.withOpacity(0.3),
                decoration: InputDecoration(
                    //buscar
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 0.0),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    hintText: "Buscar"),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            TabBar(
              indicatorColor:
                  Color.fromARGB(255, 252, 252, 252), //menu activo border
              unselectedLabelColor:
                  Color.fromARGB(26, 252, 0, 0), //menu inactivo
              labelColor: Color.fromARGB(255, 255, 255, 255), //menu activo
              isScrollable: true,
              labelStyle: const TextStyle(fontSize: 17.0),
              controller: _tabController,
              tabs: const [
                Tab(
                  text: "sillas",
                ),
                Tab(
                  text: "Muebles",
                ),
                Tab(
                  text: "Camas",
                ),
                Tab(
                  text: "cunas",
                ),
                Tab(
                  text: "cuadros",
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Expanded(
                child: TabBarView(
              children: [
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    muebles(
                      "assets/pict/s1.png",
                      "silla gris",
                      "hola",
                      "36.99",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/s2.png",
                      "silla verde",
                      "hola",
                      "47.50",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/s3.png",
                      "silla naranja",
                      "hola",
                      "29.99",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/s4.png",
                      "silla roja",
                      "hola",
                      "25.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/s5.png",
                      "silla blanca",
                      "hola",
                      "24.20",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    muebles(
                      "assets/pict/m1.jpg",
                      "gabetero gris",
                      "hola",
                      "70.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/m2.jpg",
                      "librero",
                      "hola",
                      "1.000.000",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/m3.jpg",
                      "juguetera",
                      "hola",
                      "19.99",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/m4.jpg",
                      "mueble gris",
                      "hola",
                      "40.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/m5.jpg",
                      "mueble para tv",
                      "hola",
                      "60.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    muebles(
                      "assets/pict/c1.jpg",
                      "base para cama",
                      "hola",
                      "80.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/c2.jpg",
                      "conchon",
                      "hola",
                      "100.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/c3.jpg",
                      "cama",
                      "hola",
                      "150.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/c4.jpg",
                      "cama matrimonial",
                      "hola",
                      "200.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/c5.jpg",
                      "cama grande",
                      "hola",
                      "250.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    muebles(
                      "assets/pict/cc1.jpg",
                      "cuna",
                      "hola",
                      "100.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/cc2.jpg",
                      "cuna gabetero",
                      "hola",
                      "4.20",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/cc3.jpg",
                      "cuna gris",
                      "hola",
                      "150.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/cc4.jpg",
                      "cama cuna",
                      "hola",
                      "250.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/cc5.jpg",
                      "cuna blanca",
                      "hola",
                      "120.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    muebles(
                      "assets/pict/p1.jpg",
                      "pintura rosada",
                      "hola",
                      "10.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/p2.jpg",
                      "pintura abstracta",
                      "hola",
                      "20.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/p3.jpg",
                      "pintura azul",
                      "hola",
                      "4.20",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/p4.jpg",
                      "pintura gris",
                      "hola",
                      "11.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    muebles(
                      "assets/pict/p5.jpg",
                      "pintura loro",
                      "hola",
                      "7.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ],
              controller: _tabController,
            )),
          ]),
    ));
  }
}
