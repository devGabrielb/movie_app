import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/modules/search/Widgets/popular_movies/popular_movies_widget.dart';
import 'package:movie_app/app/modules/search/Widgets/search_input/search_input_widget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'Widgets/popular_movies/popular_movies_controller.dart';
import 'search_controller.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key key, this.title = "Search"}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchController> {
 final PopularMoviesController popularMoviesController =
      Modular.get<PopularMoviesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      // backgroundColor: Color(0XFF1f1d32),
      backgroundColor: Color(0xFFFFFAFB),
      body: Container(
        padding: EdgeInsets.only(top: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(flex: 1, child: Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16),
                child: SearchInputWidget(),
              )),
              Expanded(
                flex: 8,
                child: ListView(
                  children: <Widget>[
                    Container(
                       padding: EdgeInsets.only(left: 16, right: 16),
                        margin: EdgeInsets.only(top: 16),
                      // 
                    ),
                    Container(
                      height: 450,
                      child: PopularMoviesWidget(),
                    ),
                    
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
