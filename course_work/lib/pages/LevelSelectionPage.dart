import 'package:flutter/material.dart';
import '../classes/board.dart';
import '../classes/sudoku_levels.dart';
import '../pages/sudoku_screen.dart';

class LevelSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[300],
      appBar: AppBar(
        title: Text(
          'Выбор уровня',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.lime,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Обработка выбора уровня 1
                SudokuLevel selectedLevel = sudokuLevels[0];
                SudokuBoard sudokuBoard = SudokuBoard(selectedLevel);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SudokuScreen(sudokuBoard),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,
                minimumSize: Size(300, 60),
              ),
              child: Text(
                '1 уровень',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 16), // Расстояние между кнопками
            ElevatedButton(
              onPressed: () {
                // Обработка выбора уровня 2
                SudokuLevel selectedLevel = sudokuLevels[1];
                SudokuBoard sudokuBoard = SudokuBoard(selectedLevel);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SudokuScreen(sudokuBoard),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,
                minimumSize: Size(300, 60),
              ),
              child: Text(
                '2 уровень',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 16), // Расстояние между кнопками
            ElevatedButton(
              onPressed: () {
                // Обработка выбора уровня 3
                SudokuLevel selectedLevel = sudokuLevels[2];
                SudokuBoard sudokuBoard = SudokuBoard(selectedLevel);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SudokuScreen(sudokuBoard),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,
                minimumSize: Size(300, 60),
              ),
              child: Text(
                '3 уровень',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 16), // Расстояние между кнопками
            ElevatedButton(
              onPressed: () {
                // Обработка выбора уровня 4
                SudokuLevel selectedLevel = sudokuLevels[3];
                SudokuBoard sudokuBoard = SudokuBoard(selectedLevel);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SudokuScreen(sudokuBoard),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,
                minimumSize: Size(300, 60),
              ),
              child: Text(
                '4 уровень',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 16), // Расстояние между кнопками
            ElevatedButton(
              onPressed: () {
                // Обработка выбора уровня 5
                SudokuLevel selectedLevel = sudokuLevels[4];
                SudokuBoard sudokuBoard = SudokuBoard(selectedLevel);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SudokuScreen(sudokuBoard),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,
                minimumSize: Size(300, 60),
              ),
              child: Text(
                '5 уровень',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 16), // Расстояние между кнопками
            ElevatedButton(
              onPressed: () {
                // Обработка выбора уровня 6
                SudokuLevel selectedLevel = sudokuLevels[5];
                SudokuBoard sudokuBoard = SudokuBoard(selectedLevel);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SudokuScreen(sudokuBoard),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,
                minimumSize: Size(300, 60),
              ),
              child: Text(
                '6 уровень',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}