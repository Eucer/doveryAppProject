import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/search/widgets/carousel_recent_search_widgets.dart';
import 'package:v1douvery/features/search/widgets/recomendYou.dart';

import 'package:v1douvery/features/search/widgets/searchignClient.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          elevation: 0,
          title: FadeInLeft(
            duration: const Duration(milliseconds: 300),
            from: 10,
            child: Text(
              'Buscador',
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(IconlyLight.activity),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(IconlyLight.category),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.blue[900],
        ),
      ),
      body: ListView(
        children: const [
          SearchWidget(),
          carouselRecentSearch(),
        ],
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  void navigateToSearchingScreen(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchingPage(
                searchQuery: query,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          child: Container(
            height: 55,
            width: double.infinity,
            color: GlobalVariables.appBarbackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Material(
                  child: TextFormField(
                    autofocus: true,
                    onFieldSubmitted: navigateToSearchingScreen,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                      hintText: 'Busca tu articulo ...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
