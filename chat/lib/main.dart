import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'noteProvider.dart';
import 'noteListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: "Notes App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NoteListScreen(),
      ),
    );
  }
}