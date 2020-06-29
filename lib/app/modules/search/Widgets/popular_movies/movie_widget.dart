import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/app/modules/search/models/movie_model.dart';
import 'package:movie_app/configs.dart';

class MoviePopularItem extends StatelessWidget {
  final bool active;
  final MovieModel moviesModel;
  final double top;
  final Color colorbar;
  final Color shadowColorbar;

  MoviePopularItem({Key key, this.active, this.moviesModel})
      : top = active ? 20 : 100,
        colorbar = moviesModel.voteAverage >= 7 ? Color(0XFF1FAE68) : Color(0XFFd5d749),
        shadowColorbar =
            moviesModel.voteAverage >= 7 ? Color(0XFF5FC7B0) : Color(0XFF3F3B11),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/movieDetails', arguments: moviesModel);
      },
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: top, right: 30, bottom: 20),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom:0,
              
              child: Material(
                shadowColor: Colors.black,
                color: Colors.transparent,
                 borderRadius: BorderRadius.circular(20),
                elevation: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: moviesModel.id,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          '${Configs.baseUrlImage}${moviesModel.posterPath}',
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   right: 15,
            //   bottom: 0,
            //   child: Container(
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Color(0XFF081C22),
            //           borderRadius: BorderRadius.circular(50)),
            //       child: SleekCircularSlider(
            //         appearance: CircularSliderAppearance(
            //             infoProperties: InfoProperties(
            //                 mainLabelStyle: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 14.0,
            //                     fontWeight: FontWeight.w500),
            //                 modifier: (double value) {
            //                   final vote = value.toStringAsPrecision(2);
            //                   return '$vote';
            //                 }),
            //             size: 60.0,
            //             startAngle: 180,
            //             angleRange: 340,
            //             customColors: CustomSliderColors(
            //                 trackColor: Color(0XFF1E4229),
            //                 progressBarColor: colorbar,
            //                 shadowColor: shadowColorbar,
            //                 shadowMaxOpacity: 1),
            //             customWidths: CustomSliderWidths(
            //                 trackWidth: 1,
            //                 progressBarWidth: 10,
            //                 shadowWidth: 10)),
            //         min: 0,
            //         max: 10.0,
            //         initialValue: moviesModel.voteAverage,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
