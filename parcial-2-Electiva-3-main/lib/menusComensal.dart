import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:parcial2_etps3/comestibles.dart';

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

            //dibuja la imagen
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage(
                                'assets/img/135579140_248966746754779_1436238107869001113_n.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              "TORTAS EL SARCO",
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
                    hintText: "Busca tú Combo"),
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
                  text: "Hamburguesa",
                ),
                Tab(
                  text: "Pizza",
                ),
                Tab(
                  text: "Pollo",
                ),
                Tab(
                  text: "Tacos",
                ),
                Tab(
                  text: "pupas",
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
                    menus(
                      "assets/pict/hamburguesa01.png",
                      "rica hamburguesa",
                      "test",
                      "36.99",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/hamburguesa02.png",
                      "cangreburger",
                      "test",
                      "47.50",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/hamburguesa03.png",
                      "hamburguesa celestial",
                      "test",
                      "29.99",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/hamburguesa05.jpg",
                      "hamburguesa shrek",
                      "test",
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
                    menus(
                      "assets/pict/pizza01.jpg",
                      "pizza sabrosa",
                      "test",
                      "70.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/pizza02.jpg",
                      "pizza cremosa",
                      "test",
                      "1.000.000",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/pizza03.jpg",
                      "pizza jugosa",
                      "test",
                      "19.99",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/pizza04.jpg",
                      "pizza calsone",
                      "test",
                      "40.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    menus(
                      "assets/pict/pollo01.jpg",
                      "pollo lito",
                      "test",
                      "80.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/pollo02.jpg",
                      "pollo sabroso",
                      "test",
                      "100.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/pollo03.jpg",
                      "pollo delicious",
                      "test",
                      "150.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/pollo04.jpg",
                      "pollo grand",
                      "test",
                      "200.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    menus(
                      "assets/pict/tacos01.jpg",
                      "tacos pastor",
                      "test",
                      "100.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/tacos02.jpg",
                      "tacos pollo",
                      "test",
                      "4.20",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/tacos03.jpg",
                      "taco mer",
                      "test",
                      "150.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/tacos04.jpg",
                      "tacos mix",
                      "test",
                      "250.00",
                    ),
                  ],
                ),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    menus(
                      "assets/pict/pupas01.jpg",
                      "pupas revueltas",
                      "test",
                      "10.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/pupas02.jpg",
                      "pupas cochinito",
                      "test",
                      "20.00",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/pupas03.jpg",
                      "pupas moradas",
                      "test",
                      "4.20",
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    menus(
                      "assets/pict/pupas04.jpg",
                      "pupas ayote",
                      "test",
                      "11.00",
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
