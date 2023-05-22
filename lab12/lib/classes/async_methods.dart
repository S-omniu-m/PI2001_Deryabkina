import 'dart:async';

Future<void> waterHeating() async {
  print('Подогрев воды');
  var waitingFuture = Future<Object?>.delayed(const Duration(seconds: 3));
  await waitingFuture.then((_) => print('Вода подогрелась'));
}

Future<void> coffeeMaking() async {
  print('Варка кофе');
  var waitingFuture = Future<Object?>.delayed(const Duration(seconds: 5));
  await waitingFuture.then((_) => print('Кофе сварено'));
}

Future<void> milkShaking() async {
  print('Добаление молока');
  var waitingFuture = Future<Object?>.delayed(const Duration(seconds: 5));
  await waitingFuture.then((_) => print('Молоко добавлено'));
}

Future<void> gathering() async {
  print('Смешиваем ингредиенты');
  var waitingFuture = Future<Object?>.delayed(const Duration(seconds: 3));
  await waitingFuture.then((_) => print('Кофе готов!'));
}