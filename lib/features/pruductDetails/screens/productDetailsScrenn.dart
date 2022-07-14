import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/centerSearchNav.dart';
import 'package:v1douvery/NAV/topTitleButtom.dart';
import 'package:v1douvery/common/widgets/header_text.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/brands/screens/brandsScreen.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/models/ratings.dart';
import 'package:v1douvery/provider/user_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Rating>? rating;
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  double avgRating = 0;
  double myRating = 0;
  double totalRating = 0;
  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          elevation: 0,
          title: FadeInLeft(
            from: 10,
            child: const Text(
              'Volver',
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(IconlyLight.addUser),
              onPressed: () {},
            ),
            Badge(
              position: BadgePosition.topEnd(top: 2, end: 3),
              animationDuration: Duration(milliseconds: 300),
              badgeColor: Color(0xffe84118),
              badgeContent: Text(
                userCartLen.toString(),
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              child: IconButton(
                icon: const Icon(IconlyLight.buy),
                onPressed: () {},
              ),
            ),
          ],
          backgroundColor: Colors.blue[900],
        ),
      ),

      //SelectBody
      body: SingleChildScrollView(
        child: Column(
          children: [
            CenterSearchNav(),
            Product == null
                ? const Loader()
                : Column(
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
                                  children: [
                                    Stars(rating: avgRating),

                                    Text(
                                      '(' +
                                          avgRating.toString() +
                                          ') ' +
                                          widget.product.rating!.length
                                              .toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Precio: ',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),

                                    Text(
                                      '\$${widget.product.price}',
                                      style: TextStyle(
                                        color: Color(0xff1C2833),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.4,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    //
                                    Text(
                                      'Envio: ',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),

                                    Text(
                                      'Gratis',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 4, 161, 17),
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      child: CarouselSlider(
                        items: widget.product.images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => PinchZoom(
                                child: CachedNetworkImage(
                                  imageUrl: i,
                                  height: 1500,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                                resetDuration:
                                    const Duration(milliseconds: 1500),
                                maxScale: 3.5,
                                onZoomStart: () {
                                  print('Start zooming');
                                },
                                onZoomEnd: () {
                                  print('Stop zooming');
                                },
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 400,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(
                              () {
                                _current = index;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: GlobalVariables.backgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.product.images.asMap().entries.map(
                      (entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 9.0,
                            height: 9.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Color.fromARGB(255, 68, 62, 62)
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.5 : 0.1)),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BrandsScreen(
                                brands: widget.product.marca,
                              ),
                              settings: RouteSettings(
                                arguments: widget.product.marca,
                              ),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(
                              top: 20,
                              left: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.house_outlined,
                                      size: 16,
                                      color: Color(0xff10375C),
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.product.marca,
                                    style: TextStyle(
                                      color: Color(0xff10375C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              widget.product.name,
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 00),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(0),
                    color: Colors.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff1a49ab), // background
                                    // foreground
                                  ),
                                  onPressed: addToCart,
                                  icon: Icon(IconlyLight.buy, size: 16),
                                  label: Text("Añadir al Carrito"),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffed174f), // background
                                    // foreground
                                  ),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddressScreen(
                                        totalAmount:
                                            widget.product.price.toString(),
                                        cantid: widget.product.name.toString(),
                                      ),
                                    ),
                                  ),
                                  icon: Icon(Icons.payments, size: 16),
                                  label: Text("Pagar"),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xfff1f5f9)),
                        ),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      height: 500,
                      child: ContainedTabBarView(
                        tabs: const [
                          Text(
                            'Descripcion',
                            style: TextStyle(
                              color: Color.fromARGB(206, 0, 0, 0),
                            ),
                          ),
                          Text(
                            'Servicio',
                            style: TextStyle(
                              color: Color.fromARGB(206, 0, 0, 0),
                            ),
                          ),
                          Text(
                            'Reseñas',
                            style: TextStyle(
                              color: Color.fromARGB(206, 0, 0, 0),
                            ),
                          ),
                          Text(
                            'Similar',
                            style: TextStyle(
                              color: Color.fromARGB(206, 0, 0, 0),
                            ),
                          ),
                        ],
                        views: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.product.description,
                              ),
                            ),
                          ),
                          Container(child: Text('text')),
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Container(child: Text('Tu rating :  ')),
                                  Container(
                                    color: Colors.white,
                                    child: RatingBar.builder(
                                      initialRating: myRating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: GlobalVariables.colorstarsrating,
                                      ),
                                      onRatingUpdate: (rating) {
                                        productDetailsServices.rateProduct(
                                            context: context,
                                            product: widget.product,
                                            rating: rating);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                                child: Container(
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: widget.product.rating!.length,
                                      itemBuilder: ((context, index) {
                                        final rating =
                                            widget.product.rating![index];
                                        return Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                rating.userId,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              alignment: Alignment.bottomLeft,
                                              child: Row(
                                                children: [
                                                  Stars(rating: rating.rating),
                                                  Text(
                                                    '(' +
                                                        avgRating.toString() +
                                                        ') ' +
                                                        widget.product.rating!
                                                            .length
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      })),
                                ),
                              ),
                            ],
                          ),
                          Container(child: Text('text')),
                        ],
                        // ignore: avoid_print
                        onChange: (index) => print(index),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
