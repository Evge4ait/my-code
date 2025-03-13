void main() {
  makeTask(() => doSomething(40)); // передает заданную температуру
  makeTask(() => doSomething(-300)); // для теста на ошибку
}

enum Weather {
  veryCold('very cold'),
  cold('cold'),
  warm('warm'),
  veryWarm('very warm'),
  hot('hot');

  final String description;
  const Weather(this.description);
}

String checkFreezing(int temp) =>
    temp < 0 ? 'very cold' : 'not freezing'; // проверка на мороз

Weather checkTemperature(int temp) {
  const freezing = 0; // настраиваемые значения
  const coolMax = 15;
  const warmMax = 25;
  const hotThreshold = 35;

  if (temp < -273) {
    throw Exception('Incorrect temperature $temp°C ');
  } //проверка на ошибку недопустимая температура
  if (temp < freezing) {
    return Weather.veryCold;
  } else if (temp <= coolMax) {
    return Weather.cold;
  } else if (temp <= warmMax) {
    return Weather.warm; // предыдущие условия исключают t <= coolMax
  } else if (temp <= hotThreshold) {
    return Weather.veryWarm;
  } else {
    return Weather.hot;
  }
}

void makeTask(Function task) {
  print('I\'ll check the weather forecast now'); // начало выполнения функции
  task(); //передает doSomthing
  print('Ready'); // завершение выполнения функции
}

void doSomething(int temp) {
  try {
    Weather result = checkTemperature(temp);
    print('Weather outside: ${result.description}, $temp°C');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
