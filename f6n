void main() {
  var job = Job(title: 'Flutter-разработчик', salary: 5000); // создали работу
  var people = Person(name: 'Женя', age: 33, job: job); // создаем человека
  var unemployedPerson = Person(name: 'Иван', age: 27);
  print(people.introduce());
  print(unemployedPerson.introduce());
}

class Person {
  String name; // имя
  int age; // возраст
  Job? job; // Добавление работы "?"" не у всех
  Person({required this.name, required this.age, this.job});

  String introduce() {
    String base = 'Привет, меня зовут $name, мне $age года ';
    if (job != null) {
      return base + 'и я работаю ${job!.title}';
    } else {
      return base;
    }
  }
}

class Job {
  String title; // название профессии
  int salary; // заработная плата

  Job({required this.title, required this.salary});
  String describe() {
    return 'Я работаю как $title и зарабатываю $salary долларов в месяц.';
  }
}
