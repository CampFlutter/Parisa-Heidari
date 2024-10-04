import 'package:flutter/material.dart';

class SurNameBox extends StatefulWidget {
  const SurNameBox({super.key});

  @override
  State<SurNameBox> createState() => _SurNameBoxState();
}

class _SurNameBoxState extends State<SurNameBox> {
  final surnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: surnameController,
        cursorColor:
            Colors.amber, 
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.badge),
          contentPadding: const EdgeInsets.all(15),
          labelText: 'Surname',
          hintText: 'Enter your surname',
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