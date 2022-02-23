import 'package:flutter/material.dart';
class outlined_button extends StatelessWidget {
  final String txt;
  final ontap;
  final Widget? icon;
  final Color color;
  outlined_button({required this.txt,required this.ontap,  this.icon, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return  OutlinedButton.icon(

        icon: icon ?? Container(),
        label: Text(txt,
            style: TextStyle(color: color, fontSize: 16)),
        style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color:color)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ))),
        onPressed: () {
          ontap();
        });
  }
}
