import 'package:sample_project_avoda/model/student_model.dart';

class StudentController {
  final List<Student> _students = [];

  List<Student> get students => _students;

  void addStudent(String name, String course, double score) {
    _students.add(Student(name: name, course: course, score: score));
  }
}
