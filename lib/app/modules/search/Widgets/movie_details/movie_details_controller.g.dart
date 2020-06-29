// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsController on _MovieDetailsControllerBase, Store {
  final _$moviesAtom = Atom(name: '_MovieDetailsControllerBase.movies');

  @override
  ObservableFuture<MovieCreditsModel> get movies {
    _$moviesAtom.context.enforceReadPolicy(_$moviesAtom);
    _$moviesAtom.reportObserved();
    return super.movies;
  }

  @override
  set movies(ObservableFuture<MovieCreditsModel> value) {
    _$moviesAtom.context.conditionallyRunInAction(() {
      super.movies = value;
      _$moviesAtom.reportChanged();
    }, _$moviesAtom, name: '${_$moviesAtom.name}_set');
  }

  final _$getCreditsAsyncAction = AsyncAction('getCredits');

  @override
  Future getCredits(int id) {
    return _$getCreditsAsyncAction.run(() => super.getCredits(id));
  }

  @override
  String toString() {
    final string = 'movies: ${movies.toString()}';
    return '{$string}';
  }
}
