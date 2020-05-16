import 'package:mobx/mobx.dart';

part 'search_input_controller.g.dart';

class SearchInputController = _SearchInputControllerBase
    with _$SearchInputController;

abstract class _SearchInputControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
