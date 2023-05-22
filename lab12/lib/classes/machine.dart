import 'resources.dart';
import 'enums.dart';

class Machine {
  final Resources res;

  Machine(this.res);

  ICoffee? ctype;

  ICoffee cof(ICoffee value) {
    return ctype = value;
  }

  bool isAvailableRes() {
    if (res.coffee >= ctype!.coffeeBeans() &&
        res.water >= ctype!.water() &&
        res.cash >= ctype!.cash() &&
        res.milk >= ctype!.milk()) {
      return true;
    }
    return false;
  }

  Future<void> subStractRes() async {
    int milk = ctype!.milk();
    int water = ctype!.water();
    int cash = ctype!.cash();
    int beans = ctype!.coffeeBeans();

    res.subtractMilk(milk);
    res.subtractWater(water);
    res.subtractCash(cash);
    res.subtractCoffee(beans);
  }

  bool makeCoffeeByType(String? type) {
    type = type!.toLowerCase();
    switch (type) {
      case 'americano':
        cof(CoffeeAmericano());
        if (!isAvailableRes()) {
          return false;
        }
        subStractRes();
        break;
      case 'cappucino':
        cof(CoffeeCappucino());
        if (!isAvailableRes()) {
          return false;
        }
        subStractRes();
        break;
      case 'espresso':
        cof(CoffeeEspresso());
        if (!isAvailableRes()) {
          return false;
        }
        subStractRes();
        break;
    }
    res.addMilk(0);
    return true;
  }
}
