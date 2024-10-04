import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/db/drift_database.dart';
import 'package:todo2/loginPage/loginPage.dart';

void main() {
  runApp(
    Provider<AppDatabase>(
      create: (_) => AppDatabase(),
      dispose: (_, appDatabase) =>
          appDatabase.closeDatabase(),
      child: const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  bool isChecked = false;
  final bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(obscureText: _obscureText),
    );
  }
}
