import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample_project_avoda/model/student_model.dart';

class StudentController extends ChangeNotifier {
  List<Student> _students = [];
  static const String _storageKey = 'students_data';

  List<Student> get students => _students;

  StudentController() {
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final prefs = await SharedPreferences.getInstance();
    final studentsJson = prefs.getStringList(_storageKey);
    
    if (studentsJson != null) {
      _students = studentsJson.map((json) {
        final map = Map<String, dynamic>.from(jsonDecode(json));
        return Student.fromMap(map);
      }).toList();
      notifyListeners();
    }
  }

  Future<void> _saveStudents() async {
    final prefs = await SharedPreferences.getInstance();
    final studentsJson = _students
        .map((student) => jsonEncode(student.toMap()))
        .toList();
    await prefs.setStringList(_storageKey, studentsJson);
  }

  Future<void> addStudent(String name, String course, double score) async {
    _students.add(Student(name: name, course: course, score: score));
    await _saveStudents();
    notifyListeners();
  }

  Future<void> deleteStudent(int index) async {
    if (index >= 0 && index < _students.length) {
      _students.removeAt(index);
      await _saveStudents();
      notifyListeners();
    }
  }

  Future<void> clearAll() async {
    _students.clear();
    await _saveStudents();
    notifyListeners();
  }
}