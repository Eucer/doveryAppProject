import 'package:flutter/material.dart';
import 'package:v1douvery/NAV/centerSearchNav.dart';

import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/home/screens/categoryDealsScreen.dart';

class BottomNavSearchTitle extends StatelessWidget {
  const BottomNavSearchTitle({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category) {
    MaterialPageRoute(
      builder: (context) => CategoryDealsScreen(
        category: category,
      ),
      settings: RouteSettings(
        arguments: category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CenterSearchNav(),
        SizedBox(
          height: 30,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.only(left: 5),
            color: GlobalVariables.secondaryColor,
            child: GridView.builder(
              itemCount: GlobalVariables.categoryTitle.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,

                crossAxisSpacing: 80,
                // width / height: fixed for *all* items
                childAspectRatio: 0.80, mainAxisExtent: 70,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDealsScreen(
                        category: GlobalVariables.categoryTitle[index]
                            ['title']!,
                      ),
                      settings: RouteSettings(
                        arguments: GlobalVariables.categoryTitle[index]
                            ['title']!,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          GlobalVariables.categoryTitle[index]['title']!,
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
