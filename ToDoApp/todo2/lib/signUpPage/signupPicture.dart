import 'package:flutter/material.dart';

class signupPicture extends StatelessWidget {
  const signupPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircleAvatar(
        radius: 100,
        child: Image(
          image: AssetImage("images/signupmain.png"),
        ),
      ),
    );
  }
}