abstract class Coffee {
  int get coffeeBeansNeeded;
  int get milkNeeded;
  int get waterNeeded;
  int get cashNeeded;

  static Coffee getCappuccino() {
    return _Cappuccino();
  }

  static Coffee getEspresso() {
    return _Espresso();
  }

  static Coffee getAmericano() {
    return _Americano();
  }
}

class _Espresso implements Coffee {
  @override
  int get coffeeBeansNeeded => 50;

  @override
  int get milkNeeded => 0;

  @override
  int get waterNeeded => 100;

  @override
  int get cashNeeded => 150;
}

class _Cappuccino implements Coffee {
  @override
  int get coffeeBeansNeeded => 50;

  @override
  int get milkNeeded => 200;

  @override
  int get waterNeeded => 100;

  @override
  int get cashNeeded => 300;
}

class _Americano implements Coffee {
  @override
  int get coffeeBeansNeeded => 50;

  @override
  int get milkNeeded => 0;

  @override
  int get waterNeeded => 200;

  @override
  int get cashNeeded => 200;
}