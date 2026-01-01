import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project_avoda/controller/student_controller.dart';
import 'package:sample_project_avoda/view/student_list_screen.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 60,
          width: 200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StudentListScreen(),
                ),
              );
            },
            child: const FittedBox(
              child: Text(
                "View Students",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}