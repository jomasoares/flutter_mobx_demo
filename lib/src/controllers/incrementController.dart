import 'package:mobx/mobx.dart';
part 'incrementController.g.dart';

class IncrementController = IncrementControllerAbstract with _$IncrementController;

abstract class IncrementControllerAbstract with Store {
  @observable
  int counter = 0;

  @action
  increment() {
    counter++;
  }
}
