void main() {
  makeTask(() => doSomething(10)); // передает заданную температуру
  makeTask(() => doSomething(-300)); // для теста на ошибку
}

String checkFreezing(int temp) =>
    temp < 0 ? 'very cold' : 'not freezing'; // проверка на мороз

String checkTemperature(int temp) {
  const freezing = 0; // настраиваемые значения
  const coolMax = 15;
  const warmMax = 25;

  if (temp < -273) {
    throw Exception('Incorrect temperature $temp°C ');
  }
  bool isFreezing(int temp) => temp < 0; // проверка что температура ниже нуля
  if (isFreezing(temp)) {
    return 'very cold $temp°C';
  } else if (temp <= coolMax) {
    return 'cold $temp°C';
  } else if (temp <= warmMax) {
    // предыдущие условия исключают t <= coolMax
    return 'warm $temp°C';
  } else {
    return 'very warm $temp°C';
  }
}

void makeTask(Function task) {
  print('I\'ll check the weather forecast now'); // начало выполнения функции
  task(); //передает doSomthing
  print('Ready'); // завершение выполнения функции
}

void doSomething(int temp) {
  try {
    String result = checkTemperature(temp);
    print('Weathr outside: $result');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
