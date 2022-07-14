import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v1douvery/NAV/bottomNavSearchTitle.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/home/screens/home_screens.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.appBarbackgroundColor,
            ),
          ),
          title: FadeInLeft(
            duration: const Duration(milliseconds: 300),
            from: 10,
            child: Text(
              'Volver',
              style: const TextStyle(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BottomNavSearchTitle(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff05595B)),
                    alignment: Alignment.center,
                    child: const Text(
                      'Puede que te interesen',
                      style: TextStyle(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        color: Colors.white,
                        child: headerDoubleText(
                          textHeader: '${widget.category}',
                          textAction: 'Ver mas',
                        ),
                      ),
                      productList == null
                          ? const Loader()
                          : CategoriNamed(productList: productList),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriNamed extends StatelessWidget {
  const CategoriNamed({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final List<Product>? productList;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    product: product,
                  ),
                ),
              ),
              child: Container(
                width: 150,
                decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                    color: GlobalVariables.colorTextGreylv10,
                    width: 1,
                  )),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          color: GlobalVariables.colorTextGreylv10,
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
                      margin: const EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            alignment: Alignment.center,
                            width: double.infinity,
                            color: Colors.white,
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                color: Color(0xff1C2833),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4,
                                fontSize: 12.0,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: double.infinity,
                            color: Colors.white,
                            child: Text(
                              product.marca,
                              style: const TextStyle(
                                color: Color(0xff1C2833),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.4,
                                fontSize: 11.0,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '\$${product.price}',
                              style: const TextStyle(
                                color: GlobalVariables.colorPriceSecond,
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
    );
  }
}
