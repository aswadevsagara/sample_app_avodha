import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project_avoda/controller/student_controller.dart';
import 'package:sample_project_avoda/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StudentController(),
        ),
      ],
      child: MaterialApp(
        title: 'Student Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            primary: Colors.green,
            secondary: Colors.greenAccent,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            centerTitle: true,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 16.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        home: const MyHomePage(title: 'Home Screen'),
      ),
    );
  }
}