import 'package:flutter/material.dart';
import 'package:tarea_6/Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //int currentPage = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToolBox App',
        theme:  ThemeData(
          // Define the default brightness and colors.
          //brightness: Brightness.light,
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(color: Colors.black),

          // Define the default font family.
          //fontFamily: 'Arial',

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 25),
            bodyMedium: TextStyle(fontSize: 30),
          ),
        ),
        home: const SplashScreen()
    );
  }
}

