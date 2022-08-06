import 'package:flutter/material.dart';
class ErrorImageBuilder extends StatelessWidget {
  const ErrorImageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network("https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014__340.jpg",fit: BoxFit.cover,);
  }
}