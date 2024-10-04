import 'package:flutter/material.dart';

class LoginPicture extends StatelessWidget {
  const LoginPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircleAvatar(
        radius: 120,
        child: Image(
          image: AssetImage("images/loginmain.png"),
        ),
      ),
    );
  }
}
