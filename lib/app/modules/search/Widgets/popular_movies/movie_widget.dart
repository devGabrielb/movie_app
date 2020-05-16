import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/app/modules/search/models/popular_movies_model.dart';
import 'package:movie_app/configs.dart';

class MoviePopularItem extends StatelessWidget {
  final bool active;
  final PopularMoviesModel moviesModel;
  final double blur;
  final double offsetx;
  final double offsety;
  final double top;

  MoviePopularItem({Key key, this.active, this.moviesModel})
      : blur = active ? 15 : 10,
        offsetx = active ? 5 : 0,
        top = active ? 20 : 100,
        offsety = active ? 5 : 0,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Modular.to.pushNamed('/movieDetails',arguments: moviesModel);
      },
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: top, right: 30, bottom: 40),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha(30),
            blurRadius: blur,
            
            offset: Offset(
              offsetx,
              offsety,
            ),
          ),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Hero(
            tag: moviesModel.id,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              imageUrl: '${Configs.baseUrlImage}${moviesModel.posterPath}',
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
