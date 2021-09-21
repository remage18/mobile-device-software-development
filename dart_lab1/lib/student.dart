class Student {
  late String _name;
  late String _surname;
  late String _faculty;
  late int _course;

  Student(name, surname, {faculty = 'TEF', course = 4}) {
    _name = name;
    _surname = surname;
    _faculty = faculty;
    _course = course;
  }

  Student.nameByOneString(String name) {
    var personal_info = name.split(' ');
    _name = personal_info.first;
    _surname = personal_info.last;
  }

  String get name => _name;
  String get surname => _surname;
  String get faculty => _faculty;
  int get course => _course;

  set name(String name) => _name = name;
  set surname(String surname) => _surname = surname;
  set faculty(String faculty) => _faculty = faculty;
  set course(int course) => _course = course;

  void print_info() {
    print('Student:');
    print('Name: $_name Surname: $_surname');
    print('Faculty: $_faculty Course: $_course');
  }
}
