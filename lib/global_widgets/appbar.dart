import 'package:aidber/global_widgets/colors.dart';
import 'package:flutter/material.dart';

var CustomAppbar=AppBar(
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