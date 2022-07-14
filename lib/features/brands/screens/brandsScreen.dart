import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/brands/services/marcasServices.dart';
import 'package:v1douvery/features/home/screens/home_screens.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';

class BrandsScreen extends StatefulWidget {
  final String brands;
  const BrandsScreen({
    Key? key,
    required this.brands,
  }) : super(key: key);

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  List<Product>? productList;
  final BrandsServices brandsServices = BrandsServices();

  @override
  void initState() {
    super.initState();
    fetchBrandsProducts();
  }

  fetchBrandsProducts() async {
    productList = await brandsServices.fetchBrandsProducts(
      context: context,
      brands: widget.brands,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.appBarbackgroundColor,
            ),
          ),
          title: Text(
            'Volver',
            style: const TextStyle(
              fontSize: 19,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff05595B)),
                    alignment: Alignment.center,
                    child: Text(
                      'Puede que te interesen',
                      style: const TextStyle(
                          fontSize: 17,
                          color: GlobalVariables.colorTextWhiteLight),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        color: Colors.white,
                        child: headerDoubleText(
                          textHeader: '${widget.brands}',
                          textAction: 'Ver mas',
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          color: GlobalVariables.backgroundColor,
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: productList!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final product = productList![index];
                                return GestureDetector(
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                        color:
                                            GlobalVariables.colorTextGreylv10,
                                        width: 1,
                                      )),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                              color: GlobalVariables
                                                  .colorTextGreylv10,
                                              width: 1,
                                            )),
                                            color: Colors.white,
                                          ),
                                          width: 200,
                                          height: 120,
                                          child: productList == null
                                              ? const Loader()
                                              : SingleProduct(
                                                  imagen: product.images[0],
                                                ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 2),
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                color: Colors.white,
                                                child: Text(
                                                  product.name,
                                                  style: TextStyle(
                                                    color: Color(0xff1C2833),
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 0.4,
                                                    fontSize: 12.0,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 2),
                                                width: double.infinity,
                                                color: Colors.white,
                                                child: Text(
                                                  widget.brands,
                                                  style: TextStyle(
                                                    color: Color(0xff1C2833),
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.4,
                                                    fontSize: 11.0,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '\$${product.price}',
                                                  style: TextStyle(
                                                    color: GlobalVariables
                                                        .colorPriceSecond,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 0.5,
                                                    fontSize: 14.0,
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
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
