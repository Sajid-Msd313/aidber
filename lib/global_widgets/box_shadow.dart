import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
Decoration boxdecoration = BoxDecoration(
    color: PRIMARY_COLOR,
    borderRadius: BorderRadius.circular(15.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 5,
        blurRadius: 7,
        offset:
        Offset(5, 3), // changes position of shadow
      ),
    ]);

InputBorder input_border = OutlineInputBorder(
borderRadius: BorderRadius.circular(13));