import 'package:pro_appnotes/auth/login.dart';
import 'package:pro_appnotes/auth/signup.dart';
import 'package:pro_appnotes/crud/addnotes.dart';
import 'package:pro_appnotes/home/homepage.dart';

import 'package:pro_appnotes/testtwo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

late bool islogin;

Future backgroudMessage(RemoteMessage message) async {
  print("=================== BackGroud Message ========================");
  print("${message.notification!.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroudMessage);

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: islogin == false ? Login() : HomePage(),
      home: Login(),
      // home: Test(),
      theme: ThemeData(
          // fontFamily: "NotoSerif",
          primaryColor: Colors.blue,
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 20, color: Colors.white),
            headline5: TextStyle(fontSize: 30, color: Colors.blue),
            bodyText2: TextStyle(fontSize: 20, color: Colors.black),
          )),
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "homepage": (context) => HomePage(),
        "addnotes": (context) => AddNotes(),
        "testtwo": (context) => TestTwo()
      },
    );
  }
}
