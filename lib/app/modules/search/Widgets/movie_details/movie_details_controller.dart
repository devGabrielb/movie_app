import 'package:mobx/mobx.dart';
import 'package:movie_app/app/modules/search/Widgets/movie_details/repository/movie_details_repository.dart';
import 'package:movie_app/app/modules/search/models/movie_credits_model.dart';

part 'movie_details_controller.g.dart';

class MovieDetailsController = _MovieDetailsControllerBase
    with _$MovieDetailsController;

abstract class _MovieDetailsControllerBase with Store {

  final MovieDetailsRepository repository;
  _MovieDetailsControllerBase(this.repository);


  @observable
  ObservableFuture<MovieCreditsModel> movies;


  @action
  getCredits(int id) async{
    movies = ObservableFuture(repository.getCredits(id));
  }
}
