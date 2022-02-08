import 'package:aidber/screens/menu/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class headerEditProfile extends StatelessWidget {
  const headerEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Edit Profile'),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/search.png',scale:9,),
            const SizedBox(width: 8,),
            InkWell(
                onTap: (){Get.to(const MenuScreen());},
                child: Image.asset('assets/menu.png',scale: 4,))
          ],
        )
      ],
    );
  }
}
