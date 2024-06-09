import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
          leading: const Icon(Icons.menu,
              color: Color.fromARGB(255, 255, 255, 255)),
          title: const Text('Home'),
          centerTitle: false,
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          actions: const [
            Icon(Icons.search, color: Color.fromARGB(255, 255, 255, 255)),
          ]),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Test',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

