import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../edit_profile/edit_profile_view.dart';
import '../../profile_view/controllers/profile_controller.dart';
import '../../profile_view/profile_view_MainScreen.dart';
import '../../view_page/view_page_main_screen.dart';

class headerMenu extends StatelessWidget {
  const headerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(30), // Image radius
              child: Image.asset('assets/sajidmsd.jpg', fit: BoxFit.cover),
            ),
          ),
          title: const Text("Sajid"),
          subtitle: InkWell(
              onTap: ()=>Get.to(()=>profile_page_mainScreen(),binding:
              BindingsBuilder(() => {Get.put(profile_controller())})),
              child: const Text("View Profile")),
        ),
      ],
    );
  }
}
