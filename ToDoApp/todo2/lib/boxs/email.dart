import 'package:flutter/material.dart';

class email extends StatefulWidget {
  const email({super.key});

  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: emailController,
        cursorColor:
            Colors.amber,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.alternate_email_rounded),
          contentPadding: const EdgeInsets.all(15),
          labelText: 'Email',
          hintText: 'Enter your email',
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
