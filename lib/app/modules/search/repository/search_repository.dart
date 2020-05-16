import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/app/modules/search/models/popular_movies_list_model.dart';
import 'package:movie_app/configs.dart';

class SearchRepository extends Disposable {
  final Dio dio;

  SearchRepository(this.dio);

  Future<PopularMoviesListModel> getPopularMovies(int page) async {
    Response response = await dio.get("${Configs.baseUrl}popular",
        queryParameters: {
          "api_key": Configs.key,
          "language": "pt-BR",
          "page": page.toString(),
          
        });
   final PopularMoviesListModel movies = PopularMoviesListModel.fromJson(response.data);
    print(movies);
    return movies;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
