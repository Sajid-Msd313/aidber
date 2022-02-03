import 'package:aidber/screens/create_new_event/create_new_event_view.dart';
import 'package:aidber/screens/edit_profile/edit_profile_view.dart';
import 'package:aidber/screens/menu/menu_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
    );
  }
}




