import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab12/classes/machine.dart';
import 'package:lab12/classes/resources.dart';

class AddResourceScreen extends StatefulWidget {
  final Resources resources;

  const AddResourceScreen({Key? key, required this.resources}) : super(key: key);

  @override
  State<AddResourceScreen> createState() => _AddResourceScreenState();
}

class _AddResourceScreenState extends State<AddResourceScreen> {
  late Machine machine; // Используйте позднее объявление

  @override
  void initState() {
    super.initState();
    machine = Machine(widget.resources); // Создайте экземпляр Machine с использованием переданного экземпляра Resources
  }

  int get milk => widget.resources.milk;
  int get water => widget.resources.water;
  int get coffeeBeans => widget.resources.coffee;
  int get cash => widget.resources.cash;

  final textControllerMilk = TextEditingController();
  final textControllerWater = TextEditingController();
  final textControllerBeans = TextEditingController();
  final textControllerCash = TextEditingController();
  String? errorText;

  void _onChanged(String text) {
    setState(() {
      if (text == '') {
        errorText = 'Введите значение';
      } else {
        errorText = null;
      }
    });
  }

  void _onSubmitted(String text) {
    setState(() {
      if (text == '') {
        errorText = 'Введите значение';
      } else {
        errorText = null;
      }
    });
  }

  void _onPressed() {
    setState(() {
      if (textControllerMilk.text == '') {
        errorText = 'Введите значение';
      } else {
        errorText = null;
      }
    });
  }

  void addResources() {
    setState(() {
      int cash;
      int milk;
      int water;
      int beans;
      cash = int.tryParse(textControllerCash.text) ?? 0;
      milk = int.tryParse(textControllerMilk.text) ?? 0;
      water = int.tryParse(textControllerWater.text) ?? 0;
      beans = int.tryParse(textControllerBeans.text) ?? 0;
      widget.resources.addCash(cash);
      widget.resources.addCoffee(beans);
      widget.resources.addWater(water);
      widget.resources.addMilk(milk);
      textControllerMilk.text = '';
      textControllerWater.text = '';
      textControllerBeans.text = '';
      textControllerCash.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Container(
                color: Colors.lime,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      windowWidget(250),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            textFieldWidget('молоко', textControllerMilk),
            textFieldWidget('вода', textControllerWater),
            textFieldWidget('зерна', textControllerBeans),
            textFieldWidget('деньги', textControllerCash),
            CircleAvatar(
              radius: 24,
              child: IconButton(
                onPressed: addResources,
                icon: const Icon(Icons.add),
                iconSize: 30,
                splashRadius: 30,
                padding: const EdgeInsets.all(0),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget windowWidget(double height) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Container(
        color: Colors.white54,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 30),
              child: Text(
                'Ресурсы',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            resourceWidget('Молоко: ${widget.resources.milk}'),
            resourceWidget('Вода: ${widget.resources.water}'),
            resourceWidget('Зерна: ${widget.resources.coffee}'),
            resourceWidget('Деньги: ${widget.resources.cash}'),
          ],
        ),
      ),
    );
  }

  Padding resourceWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Row textFieldWidget(String text, TextEditingController textController) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: textController,
              onChanged: _onChanged,
              onSubmitted: _onSubmitted,
              onEditingComplete: _onPressed,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorText: errorText,
                hintText: 'Положите $text здесь',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
