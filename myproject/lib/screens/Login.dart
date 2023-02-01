import 'package:flutter/material.dart';
import 'package:myproject/widgets/home_app_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myproject/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pwd = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 30, right: 30),
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter your email: '),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: pwd,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Enter your Password : '),
            ),
            SizedBox(
              height: 22,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final user = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email.text, password: pwd.text);
                  if (user.user != null) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      "/home",
                      (route) => false,
                    );
                  }
                } catch (e) {
                  showError(context);
                }
              },
              child: Text("Log In"),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/register", (route) => false);
                },
                child: Text(
                  "Create Account",
                ))
          ],
        ),
      ),
    );
  }
}

Future showError(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Error"),
        content: Text("Please enter the required field"),
      );
    },
  );
}
