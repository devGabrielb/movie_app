import 'package:movie_app/app/modules/search/Widgets/movie_details/movie_details_controller.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/app/modules/search/Widgets/movie_details/repository/movie_details_repository.dart';
import 'package:movie_app/app/modules/search/repository/search_repository.dart';
import 'package:movie_app/app/modules/search/Widgets/popular_movies/popular_movies_controller.dart';
import 'package:movie_app/app/modules/search/Widgets/search_input/search_input_controller.dart';
import 'package:movie_app/app/modules/search/search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/app/modules/search/search_page.dart';

class SearchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MovieDetailsController(i.get<MovieDetailsRepository>())),
        Bind((i) => SearchRepository(i.get<Dio>())),
        Bind((i) => MovieDetailsRepository(i.get<Dio>())),
        Bind((i) => PopularMoviesController(i.get<SearchRepository>())),
        Bind((i) => SearchInputController()),
        Bind((i) => SearchController()),
        Bind((i) => Dio())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SearchPage()),
        
      ];

  static Inject get to => Inject<SearchModule>.of();
}
