
import 'package:clone_app/credentials/login_page.dart';
import 'package:clone_app/main.dart';
import 'package:clone_app/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    checkuserloggedin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.home),
      ),
    );
  }
  Future<void> gotologin() async {
  await Future.delayed(
    const Duration(seconds: 3),
  );
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (ctx) =>  const LoginPage()),
  );
}
Future<void> checkuserloggedin() async{
final _sharedprefs = await SharedPreferences.getInstance();
final userloggedin =_sharedprefs.getBool(SAVE_KEY_NAME);
if (userloggedin==null   || userloggedin ==false){
  gotologin();
}else{
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context1) => ScreenHome(),));
}

}
}

