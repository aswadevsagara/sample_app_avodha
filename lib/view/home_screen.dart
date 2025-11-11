import 'package:flutter/material.dart';
import 'package:sample_project_avoda/controller/student_controller.dart';
import 'package:sample_project_avoda/view/student_list_screen.dart';

class MyHomePage extends StatefulWidget {final StudentController controller;
  const MyHomePage({super.key, required this.title, required this.controller});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Center(
          child: SizedBox(
        height: 60,
        width: 200,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StudentListScreen(controller:widget.controller ,),
              ));
            },
            child: FittedBox(
              child: Text(
                "View students",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )),
      )),
    );
  }
}
