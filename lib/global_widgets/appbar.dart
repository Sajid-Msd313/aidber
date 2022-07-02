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


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;


  CustomAppBar({Key? key, required this.title, this.actions}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PRIMARY_COLOR,
      elevation: 0,
      title:Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        textAlign: TextAlign.center,
      ) ,
      actions: actions,

    );
  }
}
