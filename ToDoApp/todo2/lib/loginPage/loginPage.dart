import 'package:flutter/material.dart';
import 'package:todo2/boxs/email.dart';
import 'package:todo2/loginPage/loginButton.dart';
import 'package:todo2/loginPage/loginPicture.dart';
import 'package:todo2/loginPage/signUpButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required bool obscureText,
  }) : _obscureText = obscureText;

  final bool _obscureText;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
            bottom:
                BorderSide(color: Color.fromRGBO(135, 92, 206, 1), width: 2)),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(135, 92, 206, 1),
          size: 35,
          shadows: [Shadow(blurRadius: 3, color: Colors.black)],
        ),
        backgroundColor: const Color.fromRGBO(255, 120, 196, 1),
        title: const Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(blurRadius: 10, color: Color.fromRGBO(255, 62, 165, 1))
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(253, 206, 223, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 110),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(248, 232, 238, 1),
                border: Border.all(
                  color: const Color.fromRGBO(255, 120, 196, 1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 350,
              height: 560,
              child: Column(
                children: [
                  const LoginPicture(),
                  const SizedBox(
                    height: 10,
                  ),
                  const email(),
                  const SizedBox(height: 13),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      obscureText: widget._obscureText,
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        contentPadding: const EdgeInsets.all(15),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(120, 71, 164, 1)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText =
                                  !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color.fromRGBO(82, 85, 188, 1),
                        checkColor: Colors.white,
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const LoginButton(),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Color.fromRGBO(255, 120, 196, 1),
                    indent: 45,
                    endIndent: 45,
                    thickness: 2,
                  ),
                  const SignUpButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
