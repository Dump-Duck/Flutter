import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class MyObject {
  int value;
  MyObject({
    required this.value,
  });

  void increase() {
    value++;
  }

  void decrease() {
    value--;
  }

  int get values => this.value;

  set values(int newValue) {
    this.value = newValue;
  }

  void reset() {
    this.value = 0;
  }
}

class _MyAppState extends State<MyApp> {
  MyObject _myObject = MyObject(value: 0);
  String? title;
  Widget _buildText() {
    return Text(
      'Gia tri: ${_myObject.value}',
      style: const TextStyle(fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: Text(title ?? 'Debugging App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildText(),
              OutlinedButton(
                onPressed: () {
                  _myObject.decrease();
                  setState(() {});
                },
                child: const Text('Decreasing'),
              ),
              OutlinedButton(
                onPressed: () {
                  _myObject.value = 10;
                  setState(() {});
                }, 
                  child: const Text('Set value: 10'),
              ),
              OutlinedButton(
                onPressed: () {
                  _myObject.increase();
                  setState(() {});
                }, 
                  child: const Text('Increasing'),
              ),
              OutlinedButton(
                onPressed: () {
                  _myObject.reset();
                  setState(() {});
                }, 
                  child: const Text('Reset value'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}