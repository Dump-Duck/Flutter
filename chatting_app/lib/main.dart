import 'package:flutter/material.dart';

import 'homePage.dart';

void main() {
  runApp(const ChattingApp());
}

class ChattingApp extends StatelessWidget {
  const ChattingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
