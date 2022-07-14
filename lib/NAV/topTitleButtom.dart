import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/provider/user_provider.dart';

class TopTitleButtom extends StatelessWidget {
  const TopTitleButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Center(
      child: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Douvery ',
              style: GoogleFonts.lato(
                  color: Color(0xffFCFCFC), fontWeight: FontWeight.bold),
            ),
            Icon(Icons.wifi_2_bar_sharp),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.addUser),
            onPressed: () {},
          ),
          Badge(
            toAnimate: false,
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
        backgroundColor: GlobalVariables.appBarbackgroundColor,
      ),
    );
  }
}
