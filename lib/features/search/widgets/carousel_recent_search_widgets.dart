import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1douvery/common/widgets/header_double.dart';

class carouselRecentSearch extends StatefulWidget {
  const carouselRecentSearch({Key? key}) : super(key: key);

  @override
  State<carouselRecentSearch> createState() => _carouselRecentSearchState();
}

class _carouselRecentSearchState extends State<carouselRecentSearch> {
  @override
  Widget build(BuildContext context) {
    String text;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: headerDoubleText(
                    textHeader: 'Ultima Busqueda', textAction: 'Ver mas'),
              ),
              _sliderCards(),
            ],
          ),
        ],
      ),
    );
  }
}

class TituloCarousel extends StatelessWidget {
  final String title;
  const TituloCarousel({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(225, 28, 40, 51),
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    );
  }
}

Widget _sliderCards() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      color: Colors.white,
      height: 210.0,
      child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.DEFAULT,
          itemBuilder: (BuildContext context, int index) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _cards(context);
                });
          }),
    ),
  );
}

Widget _cards(BuildContext context) {
  return carouselProductOne();
}

class carouselProductOne extends StatelessWidget {
  const carouselProductOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: Container(
        width: 130,
        height: 200.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0, top: 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image(
                  width: 125.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://res.cloudinary.com/douvery/image/upload/v1656415974/Bal%C3%B3n%20de%20f%C3%BAtbol%20tradicional/wjpxxeobdeo89u35ivpl.jpg',
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'CarouselProductoOne.CarouselProducto[0].nombre',
                        style: GoogleFonts.openSans(
                          color: Color.fromARGB(255, 1, 10, 19),
                          fontWeight: FontWeight.w400,
                          fontSize: 11.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 70.0, top: 2.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 0.0),
                      child: Text(
                        'Douvery',
                        style: GoogleFonts.montserrat(
                          color: Color(0xff1C2833),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.8,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        'Envio gratis ',
                        style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 4, 161, 17),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0, bottom: 0.0),
                    child: Container(
                      child: Text(
                        '150.0 ',
                        style: GoogleFonts.roboto(
                          color: Color(0xff1C2833),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
