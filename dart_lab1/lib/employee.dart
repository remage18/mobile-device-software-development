class Person {
  String name;
  int age;
  Person(this.name, this.age);
  void show_info() {
    print('Name: $name, age: $age');
  }
}

mixin Worker {
  String company = '';
  void show_work() {
    print('Work in $company');
  }
}

class Employee extends Person with Worker {
  Employee(name, age, comp) : super(name, age) {
    company = comp;
  }
}
