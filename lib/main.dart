// import 'dart:js';

// import 'package:clone_app/credentials/login_page.dart';

// //import 'package:shared_preferences/shared_preferences.dart';


import 'package:clone_app/credentials/splash.dart';
import 'package:flutter/material.dart' ;

const SAVE_KEY_NAME = 'userloggedin';

main(List<String> args) {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple,
      ),
      home: const Splashscreen(),
    );
  }
}

// Future<void> getsaveddata(BuildContext context) async{
//   final sharedPrefs = await SharedPreferences.getInstance();
//   final password = sharedPrefs.getString('password');
//   if (password != null) {
//     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ScreenHome()),);
//   }

// }
