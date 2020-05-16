import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/modules/search/models/popular_movies_model.dart';
import 'package:movie_app/configs.dart';

class MovieDetailsWidget extends StatefulWidget {
  final PopularMoviesModel movie;

  const MovieDetailsWidget({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height * 0.8;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  double lerp(double min, double max) =>lerpDouble(min, max, _controller.value);
  @override
  Widget build(BuildContext context) {
    final double minHeight = 500.0;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
        body: Container(
      child: Stack(
        children: <Widget>[
         
            Container(
              
              height: 400,
              child: Hero(
                tag: widget.movie.id,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '${Configs.baseUrlImage}${widget.movie.posterPath}',
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
        
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: lerp(100, 500),
              padding: EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
