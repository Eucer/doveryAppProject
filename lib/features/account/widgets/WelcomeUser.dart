import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/provider/user_provider.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: GlobalVariables.rgbGradient,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(38, 38, 38, 0.4),
              offset: const Offset(
                0.0,
                5.0,
              ),
              blurRadius: 2.0,
              spreadRadius: 0.1,
            ), //BoxShadow
            //BoxShadow
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Welcome ',
                    style: TextStyle(
                      fontSize: 20,
                      color: GlobalVariables.colorTextWhiteLight,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: GlobalVariables.colorTextWhiteLight,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: IconButton(
                icon: GestureDetector(
                  child: Icon(
                    IconlyLight.setting,
                    color: GlobalVariables.colorTextWhiteLight,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              child: IconButton(
                icon: GestureDetector(
                  child: Icon(
                    IconlyLight.bag,
                    color: GlobalVariables.colorTextWhiteLight,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              child: IconButton(
                icon: GestureDetector(
                  child: Icon(
                    IconlyLight.logout,
                    color: GlobalVariables.colorTextWhiteLight,
                  ),
                  onTap: () => AccountServices().logOut(context),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
