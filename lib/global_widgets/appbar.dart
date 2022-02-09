import 'package:aidber/global_widgets/colors.dart';
import 'package:flutter/material.dart';

var CustomAppbar=AppBar(
  backgroundColor: PRIMARY_COLOR,

  title:  const SafeArea(
    child: Text(
      'LOGO',
      style: TextStyle(color: Colors.white, fontSize: 20),
      textAlign: TextAlign.center,
    ),
  ),

);