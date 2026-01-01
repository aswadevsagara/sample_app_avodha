import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project_avoda/controller/student_controller.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<StudentController>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Add Student", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: const TextStyle(color: Colors.green),
                  prefixIcon: const Icon(Icons.person, color: Colors.green),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.green.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                ),
                style: const TextStyle(fontSize: 16.0),
                validator: (value) =>
                    value!.isEmpty ? "Please enter a valid name" : null,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: courseController,
                decoration: InputDecoration(
                  labelText: "Course",
                  labelStyle: const TextStyle(color: Colors.green),
                  prefixIcon: const Icon(Icons.school, color: Colors.green),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.green.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                ),
                style: const TextStyle(fontSize: 16.0),
                validator: (value) =>
                    value!.isEmpty ? "Please enter a valid course" : null,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: scoreController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Score",
                  labelStyle: const TextStyle(color: Colors.green),
                  prefixIcon: const Icon(Icons.score, color: Colors.green),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.green.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  suffixText: "/100",
                  suffixStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(fontSize: 16.0),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a valid score";
                  }
                  final score = double.tryParse(value);
                  if (score == null || score < 0 || score > 100) {
                    return "Please enter a score between 0-100";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 4.0,
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await controller.addStudent(
                      nameController.text,
                      courseController.text,
                      double.parse(scoreController.text),
                    );
                    Navigator.pop(context, true);
                  }
                },
                child: const Text(
                  "Save Student",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}