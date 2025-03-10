void main() {
  makeTask(() => doSomething(10)); // передает заданную температуру
}

String checkFreezing(int temp) =>
    temp < 0 ? 'very cold' : 'not freezing'; // проверка на мороз надо не позабыть про not freezing !!

String checkTemperature(int temp) {
  const freezing = 0; // меняемые константы
  const coolMax = 15;
  const warmMax = 25;

  bool isFreezing(int temp) => temp < 0; // проверка что температура ниже нуля
  if (isFreezing(temp)) {
    return 'very cold';
  }

  if (temp >= freezing && temp <= coolMax) {
    // проверка на 0 <= t <= 15
    return 'cold'; // если верно возввращает 'cold' если нет идем дальше
  } else if (temp > coolMax && temp <= warmMax) {
    // проверка на 16 > t <= 25
    return 'warm'; // если верно возвращает 'warm' если нет идем дальше
  } else {
    return 'very warm'; // если t выше и не подходит по параметрам то t = very varm
  }
}

void makeTask(Function task) {
  print('I\'ll check the weather forecast now'); // начало выполнения функции
  task(); //передает doSomthing
  print('Ready'); // завершение выполнения функции
}

void doSomething(int temp) =>
    print('Weather outside: ${checkTemperature(temp)}');
