import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab12/classes/machine.dart';
import 'package:lab12/classes/resources.dart';
import 'package:lab12/classes/enums.dart';
import 'package:lab12/classes/async_methods.dart';


class MakeCoffeeScreen extends StatefulWidget {
  final Resources resources;

  const MakeCoffeeScreen({Key? key, required this.resources}) : super(key: key);

  @override
  State<MakeCoffeeScreen> createState() => _MakeCoffeeScreenState();
}

class _MakeCoffeeScreenState extends State<MakeCoffeeScreen> {
  late Machine machine; // Используется позднее объявление

  @override
  void initState() {
    super.initState();
    machine = Machine(widget.resources); // Создайте экземпляр Machine с использованием переданного экземпляра Resources
  }


  // Доступ к ресурсам через widget.resources
  int get milk => widget.resources.milk;
  int get water => widget.resources.water;
  int get coffeeBeans => widget.resources.coffee;
  int get cash => widget.resources.cash;

  void popUp(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> message(
      String text, int duration) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: duration),
      ),
    );
  }

  Coffee? coffee = Coffee.Americano;
  final textController = TextEditingController();
  String? errorText;

  void _onChanged(String text) {
    setState(() {
      if (text.isEmpty || text == '0') {
        errorText = 'Не забудьте поплнить баланс';
      } else {
        errorText = null;
      }
    });
  }

  void _onSubmitted(String text) {
    setState(() {
      if (text == '' || text == '0') {
        errorText = 'Не забудьте поплнить баланс';
      } else {
        errorText = null;
      }
    });
  }

  void _onPressed() async {
    if (textController.text.isEmpty || textController.text == '0') {
      setState(() {
        errorText = 'Не забудьте поплнить баланс';
      });
    } else {
      setState(() {
        errorText = null;
        widget.resources.addCash(int.tryParse(textController.text)!);
        textController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              width: double.infinity,
              height: 300,
              child: Container(
                color: Colors.lime,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      rowWidget('Зерна: ${widget.resources.coffee}'),
                      rowWidget('Молоко: ${widget.resources.milk}'),
                      rowWidget('Вода: ${widget.resources.water}'),
                      const SizedBox(
                        height: 10,
                      ),
                      windowWidget(220),
                    ],
                  ),
                ),
              )),
          radioPickerWidget(),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          textFieldWidget(),
        ],
      ),
    ]);
  }

  Stack radioPickerWidget() {
    return Stack(children: [
      SizedBox(
        height: 160,
        child: ListView(
          children: [
            listTileWidget('американо', Coffee.Americano),
            listTileWidget('каппучино', Coffee.Cappucino),
            listTileWidget('эспрессо', Coffee.Espresso),
          ],
        ),
      ),
      Positioned(
        right: 10,
        bottom: 0,
        child: CircleAvatar(
          radius: 24,
          child: IconButton(
              iconSize: 34,
              splashRadius: 30,
              padding: const EdgeInsets.all(0),
              onPressed: () async {
                var check = machine.makeCoffeeByType(coffee!.toNewString());
                if (!check) {
                  popUp('Недостаточно ресурсов');
                } else {
                  message('Подогрев воды', 3);
                  await waterHeating();
                  message('Вода горячая', 1);

                  message('Варка кофе', 5);
                  await coffeeMaking();
                  message('Кофе сварено', 1);

                  message('Добаление молока', 5);
                  await milkShaking();
                  message('Молоко добавлено', 1);

                  message('Смешиваем ингредиенты', 3);
                  await gathering();
                  message('Кофе готов!', 3);
                }
              },
              icon: const Icon(Icons.play_arrow)),
        ),
      ),
    ]);
  }


  Row textFieldWidget() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: _onChanged,
              onSubmitted: _onSubmitted,
              onEditingComplete: _onPressed,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: textController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorText: errorText,
                hintText: 'Пополните баланс',
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.resources.addCash(int.tryParse(textController.text)!);
              textController.text = '';
            });
          },
          icon: const Icon(Icons.money_rounded),
          iconSize: 30,
        ),
      ],
    );
  }

  SizedBox windowWidget(double height) {
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
                'Кофе-машина',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              'Текущий баланс:  ${widget.resources.cash}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

  ListTile listTileWidget(String title, Coffee value) {
    return ListTile(
      title: Text(title),
      leading: Radio<Coffee>(
        groupValue: coffee,
        value: value,
        onChanged: (Coffee? value) {
          setState(() {
            coffee = value;
          });
        },
      ),
    );
  }

  Row rowWidget(String text) {
    return Row(
      children: [
        Text(text),
      ],
    );
  }
}