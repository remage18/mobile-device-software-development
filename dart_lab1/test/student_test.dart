import 'package:test/test.dart';
import 'package:dart_lab1/student.dart';

void main() {
  test('test_name_by_one_string', () {
    var test_obj = Student.nameByOneString('Oleksandr Chaban');
    assert(test_obj.name == 'Oleksandr');
    assert(test_obj.surname == 'Chaban');
  });
}
