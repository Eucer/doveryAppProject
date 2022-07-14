import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/screens/account_screen.dart';
import 'package:v1douvery/features/cart/screens/cartScreen.dart';
import 'package:v1douvery/features/home/screens/home_screens.dart';
import 'package:v1douvery/provider/user_provider.dart';

class MainScreen extends StatelessWidget {
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
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    double bottomBarWidth = 43;
    double bottomBarBorderWidth = 2;
    List<Widget> data = [
      HomeScreen(),
      CartScreen(),
      HomeScreen(),
      AccountScreen(),
    ];

    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: CupertinoTabScaffold(
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
                        color: GlobalVariables.bottomNavHome,
                        width: bottomBarBorderWidth,
                      ),
                    ),
                  ),
                  height: 40,
                  child: const Icon(
                    Iconsax.home4,
                    size: 30,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  child: Badge(
                    toAnimate: false,
                    badgeContent: Text(userCartLen.toString()),
                    badgeColor: Colors.white,
                    child: Icon(
                      IconlyLight.buy,
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: bottomBarWidth,
                  margin: EdgeInsets.only(),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffed174f),
                        width: bottomBarBorderWidth,
                      ),
                    ),
                  ),
                  height: 40,
                  child: Icon(
                    IconlyLight.buy,
                  ),
                ),
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.coin,
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Iconsax.user_octagon,
                ),
                activeIcon: Container(
                  width: bottomBarWidth,
                  margin: EdgeInsets.only(),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: GlobalVariables.buttomColor,
                        width: bottomBarBorderWidth,
                      ),
                    ),
                  ),
                  height: 40,
                  child: Icon(
                    Iconsax.user_octagon,
                    size: 30,
                  ),
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
            return Container(
              child: CupertinoTabView(
                builder: (context) {
                  return data[index];
                },
              ),
            );
          },
        ));
  }
}
