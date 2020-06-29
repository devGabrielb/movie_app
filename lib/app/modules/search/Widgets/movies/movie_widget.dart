import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/modules/search/models/movie_model.dart';

import '../../../../../configs.dart';

class Movie extends StatelessWidget {
  final MovieModel movie;

  const Movie({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Modular.to.pushNamed('/movieDetails', arguments: movie);
      },
      child: Container(
       
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: movie.id,
                  child: CachedNetworkImage(
                    height: 270,            
                    fit: BoxFit.cover,
                    imageUrl: '${Configs.baseUrlImage}${movie.posterPath}',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0XFF131515)),
              ),
            ),
            Row(
              children: <Widget>[
                Icon(Icons.star, color: Colors.yellow,size: 20,),
                SizedBox(width: 5,),
                Text('${movie.voteAverage}')
              ],
            )
          ],
        ),
      ),
    );
  }
}
