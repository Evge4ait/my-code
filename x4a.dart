void main() {
  makeTask(() => doSomething(40)); // передает заданную температуру
  makeTask(() => doSomething(-300)); // для теста на ошибку
}

enum Weather {
  veryCold('очень холодно'),
  cold('холодно'),
  warm('тепло'),
  veryWarm('очень тепло'),
  hot('жарко');

  final String description;
  const Weather(this.description);
}

class Temperature {
  final int value;

  Temperature(this.value);

  Weather getWeather() {
    if (value < -273) throw Exception('Недопустимая температура $value°C ');
    if (value < 0) return Weather.veryCold;
    if (value <= 15) return Weather.cold;
    if (value <= 25) return Weather.warm;
    if (value <= 35) return Weather.veryWarm;
    return Weather.hot;
  }
}

void makeTask(Function task) {
  print('Сейчас гляну какая погода на улице'); // начало выполнения функции
  task(); //передает doSomthing
  print('Готово'); // завершение выполнения функции
}

void doSomething(int temp) {
  try {
    Temperature temperature = Temperature(temp);
    Weather result = temperature.getWeather();
    print('Погода на улице: ${result.description}, $temp°C');
  } catch (e) {
    print('Ошибка: ${e.toString()}');
  }
}
