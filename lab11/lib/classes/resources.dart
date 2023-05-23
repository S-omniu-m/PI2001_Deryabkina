// класс Ресурсов
class Resources {
  int coffeeBeans = 0;
  int milk = 0;
  int water = 0;
  int cash = 0;

  // получение кол-ва ресурсов
  int getResource(int type) {
    switch (type) {
      case 1:
        return coffeeBeans;
      case 2:
        return milk;
      case 3:
        return water;
      case 4:
        return cash;
      default:
        print("Неправильно выбран тип ресурса!");
        return -1;
    }
  }

  // добавление ресурсов
  void setResource(int type, int value) {
    switch (type) {
      case 1:
        coffeeBeans += value;
        break;
      case 2:
        milk += value;
        break;
      case 3:
        water += value;
        break;
      case 4:
        cash += value;
        break;
      default:
        print("Неправильно выбран тип ресурса!");
    }
  }
}