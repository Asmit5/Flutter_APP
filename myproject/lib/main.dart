import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/screens/Login.dart';
import 'package:myproject/screens/Register.dart';
import 'package:myproject/screens/booked.dart';
import 'package:myproject/screens/home_screen.dart';
import 'package:myproject/screens/welcome_screen.dart';
import 'package:myproject/widgets/home_app_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myproject/firebase_options.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Color(0xFFEDF2F6),
      // ),
      home: WelcomeScreen(),

      routes: {
        "/welcome": (context) => WelcomeScreen(),
        "/home": (context) => HomePage(),
        "/login": (context) => Login(),
        "/register": (context) => Register(),
        "/book": (context) => Booked()
      },
    );
  }
}
