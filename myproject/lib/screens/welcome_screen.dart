import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myproject/firebase_options.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/Annarpurna.jpg"),
        fit: BoxFit.cover,
        opacity: 0.7,
      )),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enjoy",
                  style: TextStyle(
                    color: Color.fromARGB(255, 12, 2, 2),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "the view!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 1, 1).withOpacity(0.9),
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "A mountain trip is an excursion or journey that takes place in a mountainous region. It can involve activities such as hiking, climbing, skiing, and camping.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 0, 0).withOpacity(0.7),
                    fontSize: 16,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/login");
                    },
                    child: Container(
                        width: 80,
                        height: 50,
                        padding: EdgeInsets.all(17.5),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text("Log In")),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
