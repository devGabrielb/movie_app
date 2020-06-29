import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/modules/search/models/movie_credits_model.dart';

import '../../../../../../configs.dart';

class CastDetails extends StatelessWidget {
  final List<Cast> cast;

  const CastDetails({Key key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return CastDetailsItem(cast: cast[index]);
        },
      ),
    );
  }
}

class CastDetailsItem extends StatelessWidget {
  final Cast cast;

  const CastDetailsItem({Key key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 100,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: 103,
            height: 103,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: '${Configs.baseUrlImage}${cast.profilePath}',
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text('${cast.name}',
            
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                    fontSize: 12,
                    color: Color(0XFF131515),
                    )),
          ),
        ],
      ),
    );
  }
}
