import 'package:flutter/material.dart';
class make_rounded_text_type extends StatelessWidget {
final String text;
make_rounded_text_type({required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)
      ),
      child:  Text(text, style: TextStyle(fontSize: 12),),
    );
  }
}
