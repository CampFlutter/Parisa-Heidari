import 'package:flutter/material.dart';
import 'package:todo2/boxs/SurNameBox.dart';
import 'package:todo2/boxs/email.dart';
import 'package:todo2/boxs/nameBox.dart';
import 'package:todo2/signUpPage/signupButtonInSignupPage.dart';
import 'package:todo2/signUpPage/signupPicture.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          "Sign Up",
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
              margin: const EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(248, 232, 238, 1),
                border: Border.all(
                  color: const Color.fromRGBO(255, 120, 196, 1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 350,
              height: 645,
              child: Column(
                children: [
                  const signupPicture(),
                  const SizedBox(
                    height: 10,
                  ),
                  const nameBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SurNameBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  const email(),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      // controller: passwordController,
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
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      obscureText: _obscureText,
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        contentPadding: const EdgeInsets.all(15),
                        labelText: 'Confirm password',
                        hintText: 'Confirm your password',
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
                  const SizedBox(
                    height: 36,
                  ),
                  const signupButtonInSignupPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
