import 'package:flutter/material.dart';
import 'package:lab12/classes/machine.dart';
import 'package:lab12/classes/resources.dart';
import 'package:lab12/pages/addResourceScreen.dart';
import 'package:lab12/pages/makeCoffeeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Machine? machine;
  Resources resources = Resources(0, 0, 0, 0); // Создаем экземпляр Resources

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Кофе-машина'),
            backgroundColor: Colors.brown,
            bottom: const TabBar(
              tabs: [
                Icon(Icons.coffee_maker),
                Icon(Icons.add),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MakeCoffeeScreen(resources: resources), // Передаем экземпляр Resources
              AddResourceScreen(resources: resources), // Передаем экземпляр Resources
            ],
          ),
        ),
    );
  }
}