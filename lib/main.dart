import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Список элементов"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child:
          ListView.builder(
            itemBuilder: (context, index) {
              int result = pow(2, index) as int;
              if ((result == 0 || result < 0) && index > 0) {
                return TextWidget(text: "2 ^ $index = ∞");
              }
              return TextWidget(text: "2 ^ $index = $result");
            },
          ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 80,
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.1)),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
