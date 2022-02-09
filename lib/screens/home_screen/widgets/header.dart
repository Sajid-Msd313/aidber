import 'package:aidber/global_widgets/text_fields.dart';
import 'package:aidber/screens/menu/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
            child: CustomHeaderTextFormField(
          hint: "Search...",
          prefixIcon: Icon(Icons.search),
        )),
        SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: (){
            Get.to(()=>MenuScreen() );
          },
          child: Image.asset(
            "assets/menu.png",
            scale: 2,
          ),
        ),
      ],
    );
  }
}
