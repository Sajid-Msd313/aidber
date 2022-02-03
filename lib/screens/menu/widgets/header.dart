import 'package:flutter/material.dart';

class headerMenu extends StatelessWidget {
  const headerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: Icon(Icons.arrow_back),
        title: Text('Menu'),
        trailing: Icon(Icons.search),
      ),
      ListTile(leading:  ClipRRect(
        borderRadius: BorderRadius.circular(10), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(30), // Image radius
          child: Image.asset('assets/sajidmsd.jpg', fit: BoxFit.cover),
        ),
      ),
      title: Text("Sajid"),
      subtitle: Text("View Profile"),
      ),
    ],);
  }
}
