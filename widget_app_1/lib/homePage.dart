import 'package:flutter/material.dart';

import 'valueButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyValue _value = MyValue(value: 0);
  Widget _valueText() {
    return Text(
      '${_value.value}',
      style: const TextStyle(fontSize: 24),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_outlined),
        title: const Text('My App'),
        backgroundColor: Colors.lightBlueAccent,
        actions: const [
          Icon(Icons.notifications),
          Icon(Icons.settings),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Value',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _value.removeValue(10);
                    setState(() {});
                  },
                  icon: const Text('-10', style: TextStyle(fontSize: 18,),),
                ),
                IconButton(
                  onPressed: () {
                    _value.decrease();
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove),
                ),
                _valueText(),
                IconButton(
                  onPressed: () {
                    _value.increase();
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    _value.addValue(10);
                    setState(() {});
                  },
                  icon: const Text('+10', style: TextStyle(fontSize: 18,),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _value.reset();
                    setState(() {});
                  },
                  icon: const Icon(Icons.restart_alt)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}