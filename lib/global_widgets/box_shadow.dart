import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Decoration boxdecoration = BoxDecoration(
    color: Colors.white,
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