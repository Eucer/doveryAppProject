import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/screens/account_screen.dart';
import 'package:v1douvery/features/admin/screens/adminScreens.dart';
import 'package:v1douvery/features/admin/screens/analtyScreen.dart';
import 'package:v1douvery/features/admin/screens/ordersScreen.dart';
import 'package:v1douvery/features/home/screens/home_screens.dart';

class MainScreenAdmin extends StatelessWidget {
  static const String routeName = '/actual-home';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double bottomBarWidth = 43;
    double bottomBarBorderWidth = 2;
    List<Widget> data = [
      AdminScreen(),
      OrdersScreen(),
      AnalyticsScreen(),
    ];

    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Iconsax.home4),
            ),
            activeIcon: Container(
              width: bottomBarWidth,
              margin: EdgeInsets.only(),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff19323C),
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              height: 40,
              child: Icon(
                Iconsax.home4,
                size: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyLight.activity,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.shapes,
            ),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(26, 5, 12, 43),
          ),
        ),
        backgroundColor: GlobalVariables.backgroundNavBarColor,
        activeColor: GlobalVariables.buttomColor,
        inactiveColor: GlobalVariables.unselectedNavBarColor,
        iconSize: 28,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return data[index];
          },
        );
      },
    ));
  }
}
