import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/modules/search/Widgets/popular_movies/popular_movies_widget.dart';
import 'package:movie_app/app/modules/search/Widgets/search_input/search_input_widget.dart';
import 'search_controller.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key key, this.title = "Search"}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1f1d32),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(flex: 1, child: SearchInputWidget()),
              
              Expanded(
                
                flex: 8,
                child: ListView(
                  children: <Widget>[
                  Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Text("Popular Now",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.khula(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ),
                       Container(
                         height: 500,
                         
                         child: PopularMoviesWidget(),
                       )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
