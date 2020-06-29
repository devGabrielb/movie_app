import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/app/modules/search/models/movie_credits_model.dart';
import 'package:movie_app/configs.dart';

class MovieDetailsRepository extends Disposable{

final Dio dio;

  MovieDetailsRepository(this.dio);

  Future<MovieCreditsModel> getCredits(int id) async {
    Response response = await dio.get("${Configs.baseUrl}$id/credits",
        queryParameters: {
          "api_key": Configs.key,
          
        });
   final MovieCreditsModel movies = MovieCreditsModel.fromJson(response.data);
    print(movies.crew[0].name);
    return movies;
  }
  @override
  void dispose() {
    // TODO: implement dispose
  }


}