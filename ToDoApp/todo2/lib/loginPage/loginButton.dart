import 'package:flutter/material.dart';
import 'package:todo2/mainPage/mainPage.dart';
import 'package:todo2/db/drift_database.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppDatabase appDatabase = Provider.of<AppDatabase>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(appDatabase: appDatabase),
          ),
        );
      },
      child: Container(
        height: 50,
        width: 230,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 62, 165, 1),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: const Color.fromRGBO(140, 24, 86, 1),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              shadows: [
                Shadow(
                  color: Colors.purple.shade700,
                  blurRadius: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
