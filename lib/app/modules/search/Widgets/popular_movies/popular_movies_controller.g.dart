// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PopularMoviesController on _PopularMoviesControllerBase, Store {
  Computed<bool> _$hasresultComputed;

  @override
  bool get hasresult =>
      (_$hasresultComputed ??= Computed<bool>(() => super.hasresult)).value;

  final _$initalPageMoviesAtom =
      Atom(name: '_PopularMoviesControllerBase.initalPageMovies');

  @override
  int get initalPageMovies {
    _$initalPageMoviesAtom.context.enforceReadPolicy(_$initalPageMoviesAtom);
    _$initalPageMoviesAtom.reportObserved();
    return super.initalPageMovies;
  }

  @override
  set initalPageMovies(int value) {
    _$initalPageMoviesAtom.context.conditionallyRunInAction(() {
      super.initalPageMovies = value;
      _$initalPageMoviesAtom.reportChanged();
    }, _$initalPageMoviesAtom, name: '${_$initalPageMoviesAtom.name}_set');
  }

  final _$pageMoviesAtom =
      Atom(name: '_PopularMoviesControllerBase.pageMovies');

  @override
  int get pageMovies {
    _$pageMoviesAtom.context.enforceReadPolicy(_$pageMoviesAtom);
    _$pageMoviesAtom.reportObserved();
    return super.pageMovies;
  }

  @override
  set pageMovies(int value) {
    _$pageMoviesAtom.context.conditionallyRunInAction(() {
      super.pageMovies = value;
      _$pageMoviesAtom.reportChanged();
    }, _$pageMoviesAtom, name: '${_$pageMoviesAtom.name}_set');
  }

  final _$listMoviesAtom =
      Atom(name: '_PopularMoviesControllerBase.listMovies');

  @override
  ObservableList<PopularMoviesModel> get listMovies {
    _$listMoviesAtom.context.enforceReadPolicy(_$listMoviesAtom);
    _$listMoviesAtom.reportObserved();
    return super.listMovies;
  }

  @override
  set listMovies(ObservableList<PopularMoviesModel> value) {
    _$listMoviesAtom.context.conditionallyRunInAction(() {
      super.listMovies = value;
      _$listMoviesAtom.reportChanged();
    }, _$listMoviesAtom, name: '${_$listMoviesAtom.name}_set');
  }

  final _$listMoviesPaginationAtom =
      Atom(name: '_PopularMoviesControllerBase.listMoviesPagination');

  @override
  ObservableFuture<PopularMoviesListModel> get listMoviesPagination {
    _$listMoviesPaginationAtom.context
        .enforceReadPolicy(_$listMoviesPaginationAtom);
    _$listMoviesPaginationAtom.reportObserved();
    return super.listMoviesPagination;
  }

  @override
  set listMoviesPagination(ObservableFuture<PopularMoviesListModel> value) {
    _$listMoviesPaginationAtom.context.conditionallyRunInAction(() {
      super.listMoviesPagination = value;
      _$listMoviesPaginationAtom.reportChanged();
    }, _$listMoviesPaginationAtom,
        name: '${_$listMoviesPaginationAtom.name}_set');
  }

  final _$moviesAtom = Atom(name: '_PopularMoviesControllerBase.movies');

  @override
  ObservableFuture<PopularMoviesListModel> get movies {
    _$moviesAtom.context.enforceReadPolicy(_$moviesAtom);
    _$moviesAtom.reportObserved();
    return super.movies;
  }

  @override
  set movies(ObservableFuture<PopularMoviesListModel> value) {
    _$moviesAtom.context.conditionallyRunInAction(() {
      super.movies = value;
      _$moviesAtom.reportChanged();
    }, _$moviesAtom, name: '${_$moviesAtom.name}_set');
  }

  final _$getPopularMoviesAsyncAction = AsyncAction('getPopularMovies');

  @override
  Future getPopularMovies() {
    return _$getPopularMoviesAsyncAction.run(() => super.getPopularMovies());
  }

  final _$getPopularMoviesByPageAsyncAction =
      AsyncAction('getPopularMoviesByPage');

  @override
  Future getPopularMoviesByPage() {
    return _$getPopularMoviesByPageAsyncAction
        .run(() => super.getPopularMoviesByPage());
  }

  final _$_PopularMoviesControllerBaseActionController =
      ActionController(name: '_PopularMoviesControllerBase');

  @override
  dynamic setAllMovie(List<PopularMoviesModel> movie) {
    final _$actionInfo =
        _$_PopularMoviesControllerBaseActionController.startAction();
    try {
      return super.setAllMovie(movie);
    } finally {
      _$_PopularMoviesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'initalPageMovies: ${initalPageMovies.toString()},pageMovies: ${pageMovies.toString()},listMovies: ${listMovies.toString()},listMoviesPagination: ${listMoviesPagination.toString()},movies: ${movies.toString()},hasresult: ${hasresult.toString()}';
    return '{$string}';
  }
}
