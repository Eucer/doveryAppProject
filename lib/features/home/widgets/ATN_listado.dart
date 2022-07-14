import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/user_provider.dart';

class CardsOneWidget extends StatefulWidget {
  const CardsOneWidget({Key? key}) : super(key: key);

  @override
  State<CardsOneWidget> createState() => _CardsOneWidget();
}

class _CardsOneWidget extends State<CardsOneWidget> {
  double scrollPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 10,
          ),
          child: ClipRRect(
            child: Container(
              height: 180,
              color: const Color(0xffC70039),
              width: 85.0,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Text(
                        'Articulos Nuevos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffe9ebee),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      child: const Text(
                        'Ver mas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffe9ebee),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliderCards(),
      ],
    );
  }
}

class SliderCards extends StatelessWidget {
  PageController _controller = PageController(
    viewportFraction: 0.4,
  );

  @override
  Widget build(BuildContext context) => Padding(
        padding:
            const EdgeInsets.only(left: 100.0, top: 5.0, right: 0, bottom: 0),
        child: Container(
          color: Colors.white,
          height: 180.0,
        ),
      );
}

Widget _cards(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        right: BorderSide(
          width: 1.0,
          color: Color.fromARGB(8, 33, 33, 33),
        ),
        left: BorderSide(
          width: 1.0,
          color: Color.fromARGB(8, 33, 33, 33),
        ),
      ),
    ),
    child: Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 2.0),
            width: 120.0,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 5, bottom: 5),
              child: Center(
                child: Text(
                  'Titulos',
                  style: TextStyle(
                    color: Color(0xff1C2833),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.4,
                    fontSize: 11.0,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        ImagenViewDectetor(context),
        Container(
          height: 30,
          width: 120.0,
          color: Color(0xffFffffff),
          child: FlatButton(
            onPressed: () {
              _modalInteriorFerce(context);
            },
            child: Icon(Icons.keyboard_control),
          ),
        ),
      ],
    ),
  );
}

GestureDetector ImagenViewDectetor(BuildContext context) {
  return GestureDetector(
    child: Image(
      width: 80.0,
      height: 100.0,
      fit: BoxFit.cover,
      image: NetworkImage(
          'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Events/2021/FathersDay/Fuji_LPHero_FD21_es_US.pngs'),
    ),
  );
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.android),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

//edit modal
void _modalInteriorFerce(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 500,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 14.0, bottom: 5),
                  width: 120.0,
                  height: 10,
                  child: Expanded(
                    child: Text(
                      'Titulos',
                      style: TextStyle(
                          color: Color(0xff1C2833),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          fontSize: 12.0),
                    ),
                  ),
                ),
              ),
              Imagen(context),
              Container(
                margin: const EdgeInsets.only(top: 14.0, bottom: 5),
                width: 120.0,
                height: 30,
                child: Text(
                  'Descrop',
                  style: TextStyle(
                      color: Color(0xff1C2833),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.4,
                      fontSize: 12.0),
                ),
              ),
            ],
          ),
        );
      });
}

GestureDetector Imagen(BuildContext context) {
  return GestureDetector(
    child: Image(
      width: 120.0,
      height: 100.0,
      fit: BoxFit.cover,
      image: NetworkImage(
          'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Events/2021/FathersDay/Fuji_LPHero_FD21_es_US.pngs'),
    ),
  );
}

class BottomDetailsPriceNav extends StatelessWidget {
  const BottomDetailsPriceNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
          child: Container(
            height: 33,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: const [
                      const Icon(Icons.star,
                          color: Color(0xffE67E22), size: 16),
                      const Icon(Icons.star,
                          color: Color(0xffE67E22), size: 16),
                      const Icon(Icons.star,
                          color: Color(0xffE67E22), size: 16),
                      const Icon(Icons.star,
                          color: Color(0xffE67E22), size: 16),
                      const Icon(Icons.star,
                          color: Color(0xffE67E22), size: 16),
                      Text(
                        '4.5 (50) ',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Precio :',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),

                      Text(
                        r' $85.11 ',
                        style: TextStyle(
                          color: Color(0xff1C2833),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 10),
                      //
                      Text(
                        'Envio: ',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),

                      Text(
                        'Gratis',
                        style: TextStyle(
                            color: Color.fromARGB(255, 4, 161, 17),
                            fontSize: 15),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
