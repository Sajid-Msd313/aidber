import 'package:aidber/global_widgets/colors.dart';
import 'package:flutter/material.dart';

AppBar CustomAppbar=AppBar(
  backgroundColor: PRIMARY_COLOR,

  title:  Text(
    'LOGO',
    style: TextStyle(color: Colors.white, fontSize: 20),
    textAlign: TextAlign.center,
  ),
actions: [
  IconButton(
    icon: Image.asset('assets/search.png',height:30,width:40,),
    onPressed: () {},
  ),
  IconButton(
    icon: Image.asset('assets/notification.png',),
    onPressed: () {},
  ),
  IconButton(
    icon: Image.asset('assets/message.png',height:30,width:40,),
    onPressed: () {},
  ),
],
);
AppBar CustomAppbar1=AppBar(
  backgroundColor: PRIMARY_COLOR,
elevation: 0,

  automaticallyImplyLeading: false,
  title:Text(
    'LOGO',
    style: TextStyle(color: Colors.white, fontSize: 20),
    textAlign: TextAlign.center,
  ) ,

);