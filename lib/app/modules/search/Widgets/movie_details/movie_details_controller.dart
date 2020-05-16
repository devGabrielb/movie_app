import 'package:mobx/mobx.dart';

part 'movie_details_controller.g.dart';

class MovieDetailsController = _MovieDetailsControllerBase
    with _$MovieDetailsController;

abstract class _MovieDetailsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
