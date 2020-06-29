import 'package:mobx/mobx.dart';
import 'package:movie_app/app/modules/search/models/movie_model.dart';
import 'package:movie_app/app/modules/search/models/popular_movies_list_model.dart';
import 'package:movie_app/app/modules/search/repository/search_repository.dart';

part 'popular_movies_controller.g.dart';

class PopularMoviesController = _PopularMoviesControllerBase
    with _$PopularMoviesController;

abstract class _PopularMoviesControllerBase with Store {
  final SearchRepository repository;
  _PopularMoviesControllerBase(this.repository);

  @observable
  int initalPageMovies = 0;
  @observable
  int pageMovies = 1;

  @observable
  ObservableList<MovieModel> listMovies =
      ObservableList<MovieModel>.of([]);

  @observable
  ObservableFuture<PopularMoviesListModel> listMoviesPagination;

  @observable
  ObservableFuture<PopularMoviesListModel> movies;

  @computed
  bool get hasresult =>
      movies?.status == FutureStatus.fulfilled && movies.status != null;

  @action
  getPopularMovies() async {
    movies = ObservableFuture(repository.getPopularMovies(pageMovies));
    final list = await movies;
    initalPageMovies = list.totalPages;
    setAllMovie(list.popularMoviesModel);
    
  }

  @action
  getPopularMoviesByPage() async {
    if (pageMovies < initalPageMovies) {
      pageMovies++;
      listMoviesPagination =
          ObservableFuture(repository.getPopularMovies(pageMovies));
      final list = await listMoviesPagination;
      setAllMovie(list.popularMoviesModel);
    }
  }

  @action
  setAllMovie(List<MovieModel> movie){
    listMovies.addAll(movie);
  }

 
}
