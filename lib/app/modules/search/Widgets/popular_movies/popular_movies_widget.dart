import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/modules/search/Widgets/popular_movies/movie_widget.dart';
import 'package:movie_app/app/modules/search/Widgets/popular_movies/popular_movies_controller.dart';

class PopularMoviesWidget extends StatefulWidget {
  @override
  _PopularMoviesWidgetState createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  final PopularMoviesController moviesController =
      Modular.get<PopularMoviesController>();
  final PageController ctrl = PageController(viewportFraction: 0.8);
  String title = "Popular Now";
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      moviesController.getPopularMovies();
    }

    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentPage != next && mounted) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final futuremovies = moviesController.movies;
      if (moviesController.hasresult) {
        final item = moviesController.listMovies;

        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(title,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.rubik(
                          fontSize: 17,
                          color: Color(0XFF131515),
                          fontWeight: FontWeight.w500)),
                  FlatButton(
                    onPressed: () {
                      Modular.to.pushNamed('/moviesGridAll',arguments: [title, moviesController]);
                    },
                    child: Text("More",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.rubik(
                            fontSize: 14,
                            color: Color(0XFFEF4D88),
                            fontWeight: FontWeight.w200)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                  controller: ctrl,
                  scrollDirection: Axis.horizontal,
                  itemCount: item.length,
                  itemBuilder: (context, int index) {
                    bool active = index == currentPage;
                    return MoviePopularItem(
                      active: active,
                      moviesModel: item[index],
                    );
                  }),
            ),
          ],
        );
      } else if (futuremovies.status == FutureStatus.pending) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (futuremovies.status == FutureStatus.rejected) {
        return Center(
          child: Text("DEU MERDA"),
        );
      }
    });
  }
}
