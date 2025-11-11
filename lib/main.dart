import 'package:flutter/material.dart';
import 'package:sample_project_avoda/controller/student_controller.dart';
import 'package:sample_project_avoda/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    final controller=StudentController();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 102, 50, 190)),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Home Screen',controller: controller,),
    );
  }
}

