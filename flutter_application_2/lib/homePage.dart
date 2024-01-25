import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int value = 0;
    //final: Runtime 
    //const: Compile

    return Scaffold(
        appBar: AppBar(
            title: Text('My App'),
            backgroundColor: Colors.blue,
            actions: const [
              Icon(Icons.notifications),
              Icon(Icons.settings),
            ]),
        body: const Center(
          child: Text('Body',
              style: TextStyle(
                fontSize: 24,
              )),
        ));
  }
}
