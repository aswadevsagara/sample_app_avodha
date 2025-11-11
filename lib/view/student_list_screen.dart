import 'package:flutter/material.dart';
import 'package:sample_project_avoda/controller/student_controller.dart';
import 'package:sample_project_avoda/view/add_student_screen.dart';

class StudentListScreen extends StatefulWidget {
  final StudentController controller;

  const StudentListScreen({super.key, required this.controller});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    final students = widget.controller.students;

    return Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(
    color: Colors.white, 
  ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Student List",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          
          final added = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStudentScreen(controller: widget.controller),
            ),
          );

        
          if (added == true) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: students.isEmpty
          ? const Center(child: Text("No students found"))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final s = students[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Card(
                    color: Colors.blue,
                    child: ListTile(
                      
                      title: Text("Name: ${s.name}",style: TextStyle(color: Colors.white,fontSize: 20)),
                      subtitle: Text("Course: ${s.course}",style: TextStyle(color: Colors.white,fontSize: 15),),
                      trailing: Text("Score: ${s.score.toString()}",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
