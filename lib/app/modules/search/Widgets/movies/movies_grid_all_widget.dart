import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/modules/search/Widgets/movies/movie_widget.dart';

class MoviesGridAll extends StatefulWidget {
  final String title;
  final movies;

  const MoviesGridAll({Key key, this.title, this.movies}) : super(key: key);
  @override
  _MoviesGridAllState createState() => _MoviesGridAllState();
}

class _MoviesGridAllState extends State<MoviesGridAll> {
  ScrollController _controller;
  bool loading = false;
  

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
          setState(() {
            loading = true;
          });
      if (loading) {
        widget.movies.getPopularMoviesByPage();
         
      }
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print("reach the top");
    }
  }
  ReactionDisposer dis;
  @override
  void initState() {
    super.initState();
     dis= reaction((_) => widget.movies.listMovies.length, (msg) => setState(() {
            loading = false;
          }));
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
     dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Modular.to.pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0XFF131515),
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color(0XFF131515)),
          ),
        ),
        body: Observer(builder: (_) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                loading? Container(
                        width: MediaQuery.of(context).size.width,
                        height: 5,
                        child: LinearProgressIndicator(),
                      ):Container(),
                Expanded(
                  child: GridView.builder(
                      controller: _controller,
                      itemCount: widget.movies.listMovies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.1),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          child: Movie(movie: widget.movies.listMovies[index]),
                        );
                      }),
                ),
              ],
            ),
          );
        }));
  }
}
