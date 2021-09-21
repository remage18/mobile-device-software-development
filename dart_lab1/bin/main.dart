import 'package:dart_lab1/student.dart';
import 'package:dart_lab1/employee.dart';
import 'package:dart_lab1/factory.dart';

Function multiplay(int n) {
  return (int m) => n * m;
}

void main(List<String> arguments) {
  var student1 = Student('Oleksandr', 'Chaban');
  var student2 = Student('Mark', 'Tihonov', course: 1, faculty: 'RTF');
  var student3 = Student('Eva', 'Maslova', faculty: 'FTI', course: 3);
  var student4 = Student.nameByOneString('Genadii Lavrov')
    ..faculty = 'TEF'
    ..course = 2;
  student1.print_info();
  student2.print_info();
  student2.course = 2;
  print("Now the second student's course is- ${student2.course}");
  student3.print_info();
  student4.print_info();

  var employee = Employee('Oleksandr', 32, 'Google');
  employee.show_info();
  employee.show_work();

  var app1 = Application('Chrome Browser');
  var app2 = Application('Firefox Browser');
  app2.info();

  var func = multiplay(5);
  int res1 = func(6);
  print(res1);
  int res2 = multiplay(4)(8);
  print(res2);
  var sum = (a, b) => a + b;
  print(sum(res1, res2));

  var list = [-3, -1, 2, 4, 5, 7];
  print(list.where((element) => element > 2).join(', '));

  var set = {-3, -1, 2, 4, 5, 7};
  print(set.any((element) => element > 7));

  var map = {'six': 2, 'seven': 1, 3: 'eight', 'nine': 4, 5: 'ten'};
  print('Working with all map paramethers');
  for (var item in map.entries) {
    item.key is int ? print(item.key) : print(item.value);
  }

  print('Working only with keys');
  for (var key in map.keys) {
    print(key);
  }

  print('Working only with values');
  for (var value in map.values) {
    print(value);
  }
}
