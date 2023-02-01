import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pwd = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your name: '),
            ),
            SizedBox(
              height: 15,
            ),
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
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text, password: pwd.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Success"),
                  ),
                );
              },
              child: Text("Register"),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () async {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/login", (route) => false);
                },
                child: Text(
                  "Have Account ? Sign In",
                ))
          ],
        ),
      ),
    );
  }
}

Future showSuccess(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog();
    },
  );
}
