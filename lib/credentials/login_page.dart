import 'package:clone_app/main.dart';
import 'package:clone_app/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _textvalues = TextEditingController();

  final _password = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  onTap: () {},
                  controller: _textvalues,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 70, 79, 70)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      )),
                      labelText: 'username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  onTap: () {},
                  controller: _password,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 70, 79, 70)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      )),
                      labelText: 'password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        passcheck(context);
                      } else {
                        print('data empty');
                      }
                    },
                    child: const Text('sign up')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void passcheck(BuildContext context) async{
    final _textvalue = _textvalues.text;
    final _pass = _password.text;
    if (_textvalue == _pass) {
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME,true);
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const ScreenHome()));
       
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('wrong username or password')),
      );
    }
  }
}


// Future<void> savedData() async{
//   final sharedpref = await SharedPreferences.getInstance();
//  await sharedpref.setString('password', _textvalues)
// }