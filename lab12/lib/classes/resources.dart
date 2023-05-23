class Resources {
  int _coffeeBeans;
  int _milk;
  int _water;
  int _cash;

  Resources(this._coffeeBeans, this._milk, this._water, this._cash);

  int get milk => _milk;
  int get coffee => _coffeeBeans;
  int get water => _water;
  int get cash => _cash;

  set setMilk(int num) => _milk = num >= 0 ? num : _milk;
  set setCoffee(int num) => _coffeeBeans = num >= 0 ? num : _coffeeBeans;
  set setWater(int num) => _water = num >= 0 ? num : _water;
  set setCash(int num) => _cash = num >= 0 ? num : _cash;

  void addMilk(int num) {
    _milk += num;
  }

  void addCoffee(int num) {
    _coffeeBeans += num;
  }

  void addWater(int num) {
    _water += num;
  }

  void addCash(int num) {
    _cash += num;
  }

  void subtractMilk(int num) {
    _milk -= num;
  }

  void subtractCoffee(int num) {
    _coffeeBeans -= num;
  }

  void subtractWater(int num) {
    _water -= num;
  }

  void subtractCash(int num) {
    _cash -= num;
  }

  @override
  String toString() {
    return 'зерна: $_coffeeBeans молоко: $_milk вода: $_water деньги: $_cash';
  }
}
