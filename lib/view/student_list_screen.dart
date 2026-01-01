import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project_avoda/controller/student_controller.dart';
import 'package:sample_project_avoda/view/add_student_screen.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<StudentController>(context);
    final students = controller.students;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Student List",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        actions: [
          if (students.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep, color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Clear All Students"),
                    content: const Text(
                        "Are you sure you want to delete all students?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () async {
                          await controller.clearAll();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Clear All",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          final added = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddStudentScreen(),
            ),
          );

          if (added == true) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: students.isEmpty
          ? const Center(
              child: Text(
                "No students found",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final s = students[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${s.name}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Course: ${s.course}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Score: ${s.score.toString()}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Delete Student"),
                                    content: const Text(
                                        "Are you sure you want to delete this student?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await controller.deleteStudent(index);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}