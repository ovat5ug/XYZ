import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial2_etps3/detalle.dart';

class menus extends StatelessWidget {
  late String image;
  late String title;
  late String flavour;
  late String price;

  menus(this.image, this.title, this.flavour, this.price);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(13)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: (detalle()),
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    //bottom: 30,
                    top: 30,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  height:
                                      120, //altura del objeto pantalla principal
                                  width:
                                      120, //anchura del objeto pantalla principal
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(image),
                                      fit: BoxFit
                                          .contain, //pone en contenedor la imagen
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                //INICIO titulo
                                title,
                                style: const TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ), //FIN titulo
                              const SizedBox(
                                height: 0.01,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    //INICIO precio
                                    "\$" + price,
                                    style: const TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1,
                                        color: Colors.white),
                                  ), //FIN precio
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  Container(
                                    //INICIO añadir compra
                                    alignment: Alignment.center,
                                    height: 27,
                                    width: 27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xff7025c),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ), //FIN añadir compra
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
