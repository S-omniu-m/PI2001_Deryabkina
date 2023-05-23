import 'package:flutter/material.dart';
import 'package:course_work/pages/HomePage.dart';
import 'package:course_work/pages/LevelSelectionPage.dart';

void main() {
  runApp(SudokuApp());
}

class SudokuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku App',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/levelSelection': (context) => LevelSelectionPage(),
      },
    );
  }
}
