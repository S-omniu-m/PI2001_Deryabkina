import 'dart:io';
import 'classes/machine.dart';

// точка входа
void main() {
  var machine = Machine(); // создание экземляра

  // выбор действия
  while (true) {
    print("Выберите действие: ");
    print("1. Добавить ресурсов");
    print("2. Сделать кофе");
    print("3. Выход");

    var choice = int.parse(stdin.readLineSync()!);

    // выбор ресурса
    if (choice == 1) {
      print("Выберите тип ресурса: ");
      print("1. Кофейные зерна");
      print("2. Молоко");
      print("3. Вода");
      print("4. Наличные");

      var resourceType = int.parse(stdin.readLineSync()!);
      print("Введите количество: ");
      var resourceValue = int.parse(stdin.readLineSync()!);

      machine.fillResource(resourceType, resourceValue);
      print("Ресурсы добавлены!");
    } else if (choice == 2) { // выбор кофе
      print("Выберите тип кофе: ");
      print("1. Капучино");
      print("2. Эспрессо");
      print("3. Американо");

      var coffeeType = int.parse(stdin.readLineSync()!);
      machine.makeCoffeeByType(coffeeType);
    } else if (choice == 3) {
      break;
    } else {
      print("Неправильно выбрано действие!");
    }
  }
}