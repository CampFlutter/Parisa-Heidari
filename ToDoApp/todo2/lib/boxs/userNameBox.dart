import 'package:flutter/material.dart';

class UsernameBox extends StatefulWidget {
  const UsernameBox({
    super.key,
  });

  @override
  State<UsernameBox> createState() => _UsernameBoxState();
}

class _UsernameBoxState extends State<UsernameBox> {
  final userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: userNameController,
        cursorColor:
            Colors.amber,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.all(15),
          labelText: 'Username',
          hintText: 'Enter your Username',
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