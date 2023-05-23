import 'package:flutter/material.dart';
import '../classes/board.dart';

class SudokuScreen extends StatefulWidget {
  final SudokuBoard sudokuBoard;

  SudokuScreen(this.sudokuBoard);

  @override
  _SudokuScreenState createState() => _SudokuScreenState();
}

class _SudokuScreenState extends State<SudokuScreen> {
  int selectedRow = -1;
  int selectedCol = -1;

  void updateCellValue(int row, int col, int value) {
    setState(() {
      widget.sudokuBoard.updateCellValue(row, col, value);
      if (widget.sudokuBoard.isSolved()) {
        _showCongratulationsDialog();
      }
    });
  }

  void clearCellValue() {
    if (selectedRow != -1 &&
        selectedCol != -1 &&
        !widget.sudokuBoard.isInitialValue(selectedRow, selectedCol)) {
      setState(() {
        widget.sudokuBoard.clearCellValue(selectedRow, selectedCol);
      });
    }
  }

  void selectCell(int row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudoku'),
      ),

      body: Column(
        children: <Widget>[
          SizedBox(height: 86),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9,
                ),
                itemCount: 81,
                itemBuilder: (BuildContext context, int index) {
                  final int row = index ~/ 9;
                  final int col = index % 9;
                  final bool isSelected = selectedRow == row || selectedCol == col;
                  final bool isInitialValue =
                  widget.sudokuBoard.isInitialValue(row, col);

                  return GestureDetector(
                    onTap: () {
                      if (!isInitialValue) {
                        selectCell(row, col);
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: isSelected
                            ? Colors.lime[200]
                            : (row == selectedRow || col == selectedCol)
                            ? Colors.lime[100]
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          widget.sudokuBoard.board[row][col] != 0
                              ? widget.sudokuBoard.board[row][col].toString()
                              : '',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              for (int i = 1; i <= 5; i++)
                ElevatedButton(
                  onPressed: selectedRow != -1 &&
                      selectedCol != -1 &&
                      !widget.sudokuBoard.isInitialValue(selectedRow, selectedCol)
                      ? () {
                    updateCellValue(selectedRow, selectedCol, i);
                    setState(() {
                      selectedRow = -1;
                      selectedCol = -1;
                    });
                  }
                      : null,
                  child: Text(i.toString()),
                ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              for (int i = 6; i <= 9; i++)
                ElevatedButton(
                  onPressed: selectedRow != -1 &&
                      selectedCol != -1 &&
                      !widget.sudokuBoard.isInitialValue(selectedRow, selectedCol)
                      ? () {
                    updateCellValue(selectedRow, selectedCol, i);
                    setState(() {
                      selectedRow = -1;
                      selectedCol = -1;
                    });
                  }
                      : null,
                  child: Text(i.toString()),
                ),
              ElevatedButton(
                onPressed: selectedRow != -1 &&
                    selectedCol != -1 &&
                    !widget.sudokuBoard.isInitialValue(selectedRow, selectedCol)
                    ? () {
                  clearCellValue();
                  setState(() {
                    selectedRow = -1;
                    selectedCol = -1;
                  });
                }
                    : null,
                child: Icon(Icons.backspace),
              ),

            ],
          ),
        ],
      ),
    );
  }

  void _showCongratulationsDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Поздравляем!', textAlign: TextAlign.center),
          content: Text('Вы решили головоломку!', textAlign: TextAlign.center),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('Меню выбора уровня'),
              ),
            ),
          ],
        );
      },
    );
  }
}
