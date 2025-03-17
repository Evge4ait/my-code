void main() {
  var car = Car(color: 'черный', speed: 69); // создаем машину
  var driver = Person(name: 'Маша', age: 22); // создаем человека
  var live = House(
    city: 'Москва',
    address: 'Ленина',
    apartment: 3,
    driver: driver,
    car: car,
  ); // создаем прописку и говорим что маша водитель
  print(live.driveCar()); // выводим результат
}

class Car {
  Car({required this.color, required this.speed});

  String color; // цвет машины
  int speed; // скорость машины
}

class Person {
  Person({required this.name, required this.age});

  String name; // имя водителя
  int age; //возраст водителя
}

class House {
  House({
    required this.city,
    required this.address,
    required this.apartment,
    required this.driver,
    required this.car,
  });

  String city; // город проживания водителя
  String address; // улица проживания водителя
  int apartment; // дом проживания водителя
  Person driver; // сохраняем человека
  Car car; // сохраняем машину

  String driveCar() {
    return '${driver.name}, ${driver.age} года, едет на машине ${car.color} цвета\nCо скоростью ${car.speed} км/ч, и живет в $city, на улице $address, кв $apartment ';
  }
}
