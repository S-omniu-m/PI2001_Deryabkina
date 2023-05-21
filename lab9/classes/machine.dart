import 'dart:io';

class Machine {
  int _coffeeBeans = 0;
  int _milk = 0;
  int _water = 0;
  int _cash = 0;

  // геттеры и сеттеры
  int get coffeeBeans => _coffeeBeans;
  set coffeeBeans(int value) => _coffeeBeans = value;

  int get milk => _milk;
  set milk(int value) => _milk = value;

  int get water => _water;
  set water(int value) => _water = value;

  int get cash => _cash;
  set cash(int value) => _cash = value;

  // метод проверки доступности ресурсов
  bool isAvailable() {
    return _coffeeBeans >= 50 && _water >= 100;
  }

  // метод уменьшения ресурсов машины
  void subtractResources() {
    _coffeeBeans -= 50;
    _water -= 100;
  }

  // метод приготовления кофе
  void makingCoffee() {
    if (isAvailable()) {
      subtractResources();
      print("Кофе готов!");
    } else {
      print("Недостаточно ресурсов для приготовления кофе!\n"
          "Для приготовления нужно 50 гр кофейный зёрен и 100 мл воды\n"
          "Кофейных зёрен: ${_coffeeBeans}гр, воды: ${_water}мл");
    }
  }

  // метод добавления ресурсов
  void setResource(int type, int value) {
    switch (type) {
      case 1:
        _coffeeBeans += value;
        break;
      case 2:
        _milk += value;
        break;
      case 3:
        _water += value;
        break;
      case 4:
        _cash += value;
        break;
      default:
        print("Неправильно выбран тип ресурса!");
    }
  }
}

void main() {
  var machine = Machine(); // создание экземпляра класса
  while (true) {
    print("Выберите действие: ");
    print("1. Добавить ресурсов");
    print("2. Сделать кофе");
    print("3. Выход");

    var choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      print("Выберите тип ресурса: ");
      print("1. Кофейные зерна");
      print("2. Молоко");
      print("3. Вода");
      print("4. Наличные");

      var type = int.parse(stdin.readLineSync()!);

      print("Введите количество ресурса: ");
      var value = int.parse(stdin.readLineSync()!);

      machine.setResource(type, value);
    } else if (choice == 2) {
      machine.makingCoffee();
    } else if (choice == 3) {
      break;
    } else {
      print("Неправильно выбрано действие!");
    }
  }
}