import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/admin/widgests/addProductScreen.dart';
import 'package:v1douvery/features/admin/servicios/adminServices.dart';
import 'package:v1douvery/models/product.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProductScreen(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                child: GridView.builder(
                  itemCount: products!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 220,
                    mainAxisSpacing: 0.0,
                  ),
                  itemBuilder: (context, index) {
                    final productData = products![index];
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 110,
                        color: GlobalVariables.backgroundColor,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () =>
                                          deleteProduct(productData, index),
                                      icon: Icon(
                                        Icons.delete_forever,
                                        color: Color(0xff19323C),
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              child: SingleProduct(
                                imagen: productData.images[0],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    margin: EdgeInsets.only(left: 3),
                                    child: Text(
                                      productData.name,
                                      style: TextStyle(
                                        color: Color(0xff1C2833),
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.4,
                                        fontSize: 12.0,
                                      ),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        margin: EdgeInsets.only(left: 3),
                                        child: Text(
                                          productData.category,
                                          style: TextStyle(
                                            color: GlobalVariables
                                                .appBarbackgroundColor,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.4,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Text(
                                              'C : ' +
                                                  productData.quantity
                                                      .toString() +
                                                  ' -',
                                              style: TextStyle(
                                                color: GlobalVariables
                                                    .colorTextBlckLight,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.5,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            child: Text(
                                              ' \$${productData.price}',
                                              style: TextStyle(
                                                color: GlobalVariables
                                                    .colorPriceDetailsPrin,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.5,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
            floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.add,
                color: Color(0XFF0D3B66),
              ),
              onPressed: navigateToAddProduct,
              tooltip: 'Add Productos',
              backgroundColor: GlobalVariables.backgroundColor,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
