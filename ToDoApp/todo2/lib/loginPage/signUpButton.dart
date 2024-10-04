import 'package:flutter/material.dart';
import 'package:todo2/signUpPage/signUpPage.dart';


class SignUpButton extends StatefulWidget {
  const SignUpButton({
    super.key,
  });

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 65,
        ),
        const Text(
          "Don't have an account?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.purple.shade800,
              fontSize: 15.1,
              decoration: TextDecoration.underline,
              decorationColor: Colors.purple.shade800,
            ),
          ),
        )
      ],
    );
  }
}
