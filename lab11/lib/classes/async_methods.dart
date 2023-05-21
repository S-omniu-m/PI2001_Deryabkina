import 'enums.dart';

class CoffeeMaker {
  // Задержка с выводом сообщения
  void delayWithMessageSync(String message, int seconds) {
    final end = DateTime.now().add(Duration(seconds: seconds));
    while (DateTime.now().isBefore(end)) {}
    print(message);
  }

  // Приготовление кофе с задержкой
  void prepareCoffee(Coffee coffee) {
    print('*------------------------------*');
    print('_start_');

    if (coffee.milkNeeded > 0) {
      print('start_process: milk');
      delayWithMessageSync('done_process: frothy milk', 5);
    }

    print('start_process: water');
    delayWithMessageSync('done_process: water', 3);

    print('_then_');
    print('start_process: making coffee');
    delayWithMessageSync('done_process: coffee with water', 5);

    if (coffee.milkNeeded > 0) {
      print('_then_');
      print('start_process: coffee with milk');
      delayWithMessageSync('done_process: coffee with milk', 3);
    }

    print('_end_');
    print('Кофе готов!');
  }
}
