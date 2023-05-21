import 'resources.dart';
import 'enums.dart';

// создание класса Machine
class Machine {
  final Resources _resources = Resources(); // создание экземляра _resources

  // проверка наличия ресурсов
  bool isAvailableResource(Coffee coffee) {
    return _resources.coffeeBeans >= coffee.coffeeBeansNeeded &&
        _resources.water >= coffee.waterNeeded &&
        _resources.milk >= coffee.milkNeeded &&
        _resources.cash >= coffee.cashNeeded;
  }

  // уменьшение кол-ва ресурсов
  void subtractResources(Coffee coffee) {
    _resources.coffeeBeans -= coffee.coffeeBeansNeeded;
    _resources.water -= coffee.waterNeeded;
    _resources.milk -= coffee.milkNeeded;
    _resources.cash -= coffee.cashNeeded;
  }

  // приготовление кофе
  void makingCoffee(Coffee coffee) {
    // если ресурсов достаточно
    if (isAvailableResource(coffee)) {
      // уменьшение ресурсов
      subtractResources(coffee);
      print("Кофе готов!");
    } else {
      // если ресурсов недостаточно
      print("Недостаточно ресурсов для приготовления кофе!\n\n"
          "Для приготовления нужно ${coffee.coffeeBeansNeeded} гр кофейных зерен, "
          "${coffee.milkNeeded} мл молока и ${coffee.waterNeeded} мл воды. Стоимость: ${coffee.cashNeeded}руб.\n\n"
          "Кофейных зёрен: ${_resources.coffeeBeans}гр, молока: ${_resources.milk}мл, воды: ${_resources.water}мл, "
          "наличных: ${_resources.cash}");
    }
  }

  // пополнение ресурсов
  void fillResource(int type, int value) {
    _resources.setResource(type, value);
  }

  // выбор кофе
  void makeCoffeeByType(int type) {
    switch (type) {
      case 1:
        makingCoffee(Coffee.getCappuccino());
        break;
      case 2:
        makingCoffee(Coffee.getEspresso());
        break;
      case 3:
        makingCoffee(Coffee.getAmericano());
        break;
      default:
        print("Неправильно выбран тип кофе!");
    }
  }
}
