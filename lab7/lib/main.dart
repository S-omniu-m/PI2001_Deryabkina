import 'package:flutter/material.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Возвращение значения')),
      body: Center(child: ElevatedButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/second');
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$result !'))
          );
        },
        child: const Text('Приступить к выбору...'),
      )),
    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите любой вариант')),
      body: Container(
        padding: const EdgeInsets.fromLTRB(180, 300, 0, 0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Да');
              },
              child: const Text('Да'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Нет');
              },
              child: const Text('Нет'),
            )
          ],
        ),
      ),
    );
  }
}
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(BuildContext context) => const MainScreen(),
      '/second':(BuildContext context) => const SecondScreen(),
    },
  ));
}