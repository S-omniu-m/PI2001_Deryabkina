import 'sudoku_levels.dart';

class SudokuBoard {
  late List<List<int>> board;
  late List<List<bool>> initialValues;
  late List<List<int>> solution;

  SudokuBoard(SudokuLevel level) {
    board = List.generate(9, (_) => List<int>.filled(9, 0));
    initialValues = List.generate(9, (_) => List<bool>.filled(9, false));
    solution = level.solution; // Сохраняем правильное решение для проверки

    // Инициализируем игровое поле Судоку
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        board[row][col] = level.puzzle[row][col];
        if (board[row][col] != 0) {
          initialValues[row][col] = true;
        }
      }
    }
  }

  void updateCellValue(int row, int col, int value) {
    board[row][col] = value;
  }

  void clearCellValue(int row, int col) {
    board[row][col] = 0;
  }

  bool isInitialValue(int row, int col) {
    return initialValues[row][col];
  }

  bool isSolved() {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (board[row][col] != solution[row][col]) {
          return false; // Найдено несоответствие с правильным решением
        }
      }
    }
    return true; // Все клетки совпадают с правильным решением
  }
}
