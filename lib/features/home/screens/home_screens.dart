import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/centerSearchNav.dart';
import 'package:v1douvery/NAV/topTitleButtom.dart';
import 'package:v1douvery/common/widgets/bottom_bar.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/home/widgets/ATN_listado.dart';
import 'package:v1douvery/features/home/widgets/banner_widget.dart';
import 'package:v1douvery/features/home/widgets/deal-of-day.dart';
import 'package:v1douvery/provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: TopTitleButtom(),
      ),

      //SelectBody
      body: SingleChildScrollView(
        child: Column(
          children: [
            BottomNavSearchTitle(),
            BannerWidget(),
            CardsOneWidget(),
            DealOfDay(),
            DealOfDay(),
            DealOfDay(),
            DealOfDay(),
          ],
        ),
      ),
    );
  }
}
