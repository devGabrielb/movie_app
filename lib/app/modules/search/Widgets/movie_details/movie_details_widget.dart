import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/modules/search/Widgets/movie_details/movie_details_controller.dart';
import 'package:movie_app/app/modules/search/Widgets/movie_details/repository/movie_details_repository.dart';
import 'package:movie_app/app/modules/search/Widgets/movie_details/widgets/cast_details.dart';
import 'package:movie_app/app/modules/search/models/movie_model.dart';

import '../../../../../configs.dart';

class MovieDetailsWidget extends StatefulWidget {
  final MovieModel movie;

  const MovieDetailsWidget({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  final MovieDetailsController credits = Modular.get<MovieDetailsController>();
  int isHideOverview = 4;

  @override
  void initState() {
    super.initState();
    credits.getCredits(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        final futurecredits = credits.movies;

        if (futurecredits.status == FutureStatus.fulfilled &&
            futurecredits != null) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: MediaQuery.of(context).size.height / 2,
                  child: DecoratedBox(
                    position: DecorationPosition.background,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              '${Configs.baseUrlImage}${widget.movie.posterPath}'),
                          fit: BoxFit.cover),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width / 2.1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    widget.movie.title,
                                    style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Color(0XFF131515)),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Director: ${futurecredits.value.crew[0].name}',
                                    style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        '${widget.movie.voteAverage}',
                                        style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.yellow),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'Overview',
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Color(0XFF131515)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  // Text(
                                  //   '${widget.movie.overview}',
                                  //   maxLines: isHideOverview,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: GoogleFonts.rubik(
                                  //       fontWeight: FontWeight.w500,
                                  //       fontSize: 15,
                                  //       color: Colors.grey),
                                  // ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Wrap(
                                      children: <Widget>[
                                        Text(
                                          '${widget.movie.overview}',
                                          maxLines: isHideOverview,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.grey),
                                        ),
                                        isHideOverview == 4
                                            ? GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isHideOverview = 10;
                                                  });
                                                },
                                                child: Text(
                                                  'more',
                                                  style: GoogleFonts.rubik(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                   SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0),
                                        child: Text("Cast",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.rubik(
                                                fontSize: 18,
                                                color: Color(0XFF131515),
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          // Modular.to.pushNamed('/moviesGridAll',arguments: [title, moviesController]);
                                        },
                                        child: Text("More >",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.rubik(
                                                fontSize: 14,
                                                color: Color(0XFFEF4D88),
                                                fontWeight: FontWeight.w200)),
                                      ),
                                    ],
                                  ),
                                  

                                  Container(
                                      height: 160,
                                      child: CastDetails(
                                        cast: futurecredits.value.cast,
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 20,
                  child: Material(
                    elevation: 7,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: widget.movie.id,
                          child: CachedNetworkImage(
                            height: 250,
                            fit: BoxFit.cover,
                            imageUrl:
                                '${Configs.baseUrlImage}${widget.movie.posterPath}',
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Modular.to.pop();
                        }),
                  ),
                ),
              ],
            ),
          );
        } else if (futurecredits.status == FutureStatus.pending) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text("DEU MERDA"),
          );
        }
      }),
    );
  }
}
