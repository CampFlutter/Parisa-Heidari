import 'package:flutter/material.dart';

class nameBox extends StatefulWidget {
  const nameBox({super.key});

  @override
  State<nameBox> createState() => _nameBoxState();
}

class _nameBoxState extends State<nameBox> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: nameController,
        cursorColor:
            Colors.amber,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.all(15),
          labelText: 'Name',
          hintText: 'Enter your name',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(120, 71, 164, 1)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
