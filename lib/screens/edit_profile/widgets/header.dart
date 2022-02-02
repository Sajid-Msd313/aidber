import 'package:flutter/material.dart';


class header extends StatelessWidget {
  const header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Edit Profile'),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/search.png',scale:9,),
            SizedBox(width: 8,),
            Image.asset('assets/menu.png',scale: 4,)
          ],
        )
      ],
    );
  }
}
