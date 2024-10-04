import 'package:flutter/material.dart';

class createTaskName extends StatefulWidget {
  const createTaskName({
    super.key,
    required TextEditingController titleController,
  }) : _titleController = titleController;

  final TextEditingController _titleController;

  @override
  State<createTaskName> createState() => _createTaskNameState();
}

class _createTaskNameState extends State<createTaskName> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 2,
      controller: widget._titleController,
      cursorColor: Colors.amber,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.task_rounded),
        contentPadding: const EdgeInsets.all(15),
        labelText: 'Task',
        hintText: 'Enter your task',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color.fromRGBO(120, 71, 164, 1)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}