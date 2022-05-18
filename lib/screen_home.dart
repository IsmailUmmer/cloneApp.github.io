

import 'package:clone_app/favourites.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_screen.dart';

import 'package:flutter/material.dart';

import 'credentials/login_page.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('whatsapp'),
        actions: [
          IconButton(
            onPressed: () {signout(context);},
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Align(
                child: Text("hii", style: TextStyle(color: Colors.white)),
                alignment:  Alignment.bottomLeft,
              ),
              decoration: BoxDecoration(color: Colors.purple),
            ),
            ListTile(
              title: const Text("favourates"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const Favourates()),
                );
              },
            )
          ],
        ),
      ),
      body: SafeArea(
          child: ListView.separated(
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text('person $index'),
            subtitle: const Text('hey i am using whatsapp'),
            leading: const CircleAvatar(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return ChatScreen(name: 'person $index');
                  },
                ),
              );
            },
          );
        },
        separatorBuilder: (ctx, index) {
          return const Divider();
        },
        itemCount: 10,
      )),
    );
  }
  
  signout(BuildContext context) async{
    final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context1) => LoginPage()),
        (route) => true);
  }
}
