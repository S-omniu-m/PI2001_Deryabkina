import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';

class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

class MyBodyState extends State<MyBody> {
  List<int> _array = [];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i){
      print('num $i : нечетное = ${i.isOdd}');

      if(i.isOdd) return new Divider();

      final int index = i ~/ 2;
      final int a = pow(2,index).toInt();

      print('index $index');
      print('length ${_array.length}');

      if (index >= _array.length) _array.add(a);

      return new ListTile(title: new Text('2^$index=${_array[index]}'));
    });
  }
}

void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(body: new Center(child: new MyBody(),))
    )
);

